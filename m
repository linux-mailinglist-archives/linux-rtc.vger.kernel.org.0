Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315F338C784
	for <lists+linux-rtc@lfdr.de>; Fri, 21 May 2021 15:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhEUNNH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 May 2021 09:13:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34208 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhEUNNH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 May 2021 09:13:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 5F7071F4404B
Received: by earth.universe (Postfix, from userid 1000)
        id 6F59E3C0C96; Fri, 21 May 2021 15:11:41 +0200 (CEST)
Date:   Fri, 21 May 2021 15:11:41 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: [PATCHv2 1/5] rtc: m41t80: add support for fixed clock
Message-ID: <20210521131141.ss46m5en25kxo2v6@earth.universe>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qmi5zjayrgi3ja4s"
Content-Disposition: inline
In-Reply-To: <20210428222953.235280-2-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--qmi5zjayrgi3ja4s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexandre/Alessandro,

Can you merge this patch? It received Reviewed-by from Rob Herring
and Saravana Kannan.

It is required for the last patch adding a DT for a new board, but
there is no compile-time dependency. Thus it can just go through your
tree (just like the second patch has been merged through DRM
already).

Thanks,

-- Sebastian

On Thu, Apr 29, 2021 at 12:29:49AM +0200, Sebastian Reichel wrote:
> Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> modules SQW clock output defaults to 32768 Hz. This behaviour is
> used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> the clock is disabled and all i.MX6 functionality depending on
> the 32 KHz clock has undefined behaviour. For example when using
> the hardware watchdog the system will likely do arbitrary reboots.
>=20
> Referencing the m41t62 directly results in a deadlock. The kernel
> will see, that i.MX6 system clock needs the RTC clock and do probe
> deferral. But the i.MX6 I2C module never becomes usable without the
> i.MX6 CKIL clock and thus the RTC's clock will not be probed. So
> from the kernel's perspective this is a chicken-and-egg problem.
>=20
> Technically everything is fine by not touching anything, since
> the RTC clock correctly enables the clock on reset (i.e. on
> battery backup power loss) and also the bootloader enables it
> in case an something (e.g. an unpatched kernel) disabled this
> incorrectly.
>=20
> A workaround for this issue is describing the square wave pin
> as fixed-clock, which is registered early and basically how
> this pin is used on the i.MX6.
>=20
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-m41t80.txt |  9 +++++++++
>  drivers/rtc/rtc-m41t80.c                             | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Docum=
entation/devicetree/bindings/rtc/rtc-m41t80.txt
> index c746cb221210..cdd196b1e9bd 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> @@ -21,10 +21,19 @@ Optional properties:
>                        clock name
>  - wakeup-source: Enables wake up of host system on alarm
> =20
> +Optional child node:
> +- clock: Provide this if the square wave pin is used as boot-enabled fix=
ed clock.
> +
>  Example:
>  	rtc@68 {
>  		compatible =3D "st,m41t80";
>  		reg =3D <0x68>;
>  		interrupt-parent =3D <&UIC0>;
>  		interrupts =3D <0x9 0x8>;
> +
> +		clock {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <32768>;
> +		};
>  	};
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 89128fc29ccc..b3ece42b6f90 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -544,10 +544,22 @@ static struct clk *m41t80_sqw_register_clk(struct m=
41t80_data *m41t80)
>  {
>  	struct i2c_client *client =3D m41t80->client;
>  	struct device_node *node =3D client->dev.of_node;
> +	struct device_node *fixed_clock;
>  	struct clk *clk;
>  	struct clk_init_data init;
>  	int ret;
> =20
> +	fixed_clock =3D of_get_child_by_name(node, "clock");
> +	if (fixed_clock) {
> +		/*
> +		 * skip registering square wave clock when a fixed
> +		 * clock has been registered. The fixed clock is
> +		 * registered automatically when being referenced.
> +		 */
> +		of_node_put(fixed_clock);
> +		return 0;
> +	}
> +
>  	/* First disable the clock */
>  	ret =3D i2c_smbus_read_byte_data(client, M41T80_REG_ALARM_MON);
>  	if (ret < 0)
> --=20
> 2.30.2
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--qmi5zjayrgi3ja4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmCnsYUACgkQ2O7X88g7
+poE7Q/8DT2Lap5+ymH8slRQy+BG5Fl6nAstf2O+5UIno69pKncMjqWDwJyeznQm
0Do95ZFc9SCZRReuGrMGUbRfqbWxSe08GGhl872X8twSZYqdox63ZulMapOZNAC0
GeQlOnyt8MpP9V5ShE6S5r4lHofS+/YJsBxzREYoJW9d2Y+Nv/EBW8cXnx8kNJWi
fjmMdkn5Vr43bAfxRCU7Gh+EN29zy0M3yAHJuc25tsicacnEwXJD1Z/UFHWEQCxp
Kqt6BnDqzIHCH95LFp0mWdHWLmIqgzY9+BhP2XXZnyvlCe4jLTZdo4Okbu8kklgB
hKdXe++Ja3iNxTW4K/tkb7c96deKf76wn2Z3pm6tIy8zZUj+GnVRlu6FsnVsw9Jn
vl0tIbllgP0jMaymMrjR5RkuOia8PePXZawg/cwElga5sSF33SIu1YoCXb4lSTYG
oR5QrO1/aSUKf30neKqOCqDmOlThAdYGh/AXjULpt+UXi3B8Kaq/pGjMtD/7rFes
SlZ+JXvZR2b9ebmHFYZDaHvXzWp7ZzOi4oGmZ0MpJfAwdUUXC8cFX7t5kZ3tTvh/
OlrZtE7nIbmD0DaAptmtQ040X3uOQYkoRxrfaHS9L0cSsnVzQQmYU37CKH6Syqtp
x6w5xqrVcUkIBrtkk+RkYmQMVhq+fTuO0/tHqTjf/yFkhxfQ7HM=
=lu4U
-----END PGP SIGNATURE-----

--qmi5zjayrgi3ja4s--
