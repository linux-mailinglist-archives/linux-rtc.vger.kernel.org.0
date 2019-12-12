Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 258BB11CB2E
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2019 11:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728719AbfLLKnX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Dec 2019 05:43:23 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:51285 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728631AbfLLKnX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Dec 2019 05:43:23 -0500
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2102B10000F;
        Thu, 12 Dec 2019 10:43:21 +0000 (UTC)
Date:   Thu, 12 Dec 2019 11:43:20 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] rtc: hym8563: Read the valid flag directly instead
 of caching it
Message-ID: <20191212104320.GD855977@aptenodytes>
References: <20191212103658.937528-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline
In-Reply-To: <20191212103658.937528-1-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 12 Dec 19, 11:36, Paul Kocialkowski wrote:
> The RTC has a valid bit in the seconds register that indicates whether
> power was lost since the pevious time set. This bit is currently read
> once at probe time, cached and updated with set_time.
>=20
> Howeever, caching the bit may prevent detecting power loss at runtime
> (which can happen if the RTC's supply is distinct from the the platform's=
).
>=20
> Writing the seconds register when setting time will clear the bit,
> so there should be no downside in reading the bit directly instead of
> caching it.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/rtc/rtc-hym8563.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
> index 443f6d05ce29..584a7815f246 100644
> --- a/drivers/rtc/rtc-hym8563.c
> +++ b/drivers/rtc/rtc-hym8563.c
> @@ -78,7 +78,6 @@
>  struct hym8563 {
>  	struct i2c_client	*client;
>  	struct rtc_device	*rtc;
> -	bool			valid;
>  #ifdef CONFIG_COMMON_CLK
>  	struct clk_hw		clkout_hw;
>  #endif
> @@ -95,15 +94,16 @@ static int hym8563_rtc_read_time(struct device *dev, =
struct rtc_time *tm)
>  	u8 buf[7];
>  	int ret;
> =20
> -	if (!hym8563->valid) {
> -		dev_warn(&client->dev, "no valid clock/calendar values available\n");
> -		return -EPERM;
> -	}
> -
>  	ret =3D i2c_smbus_read_i2c_block_data(client, HYM8563_SEC, 7, buf);
>  	if (ret < 0)
>  		return ret;
> =20
> +	if (ret & HYM8563_SEC_VL) {

Ouch, I should be checking buf[0] here. Sorry about that, will send v2.

Cheers,

Paul

> +		dev_warn(&client->dev,
> +			 "no valid clock/calendar values available\n");
> +		return -EPERM;
> +	}
> +
>  	tm->tm_sec =3D bcd2bin(buf[0] & HYM8563_SEC_MASK);
>  	tm->tm_min =3D bcd2bin(buf[1] & HYM8563_MIN_MASK);
>  	tm->tm_hour =3D bcd2bin(buf[2] & HYM8563_HOUR_MASK);
> @@ -157,8 +157,6 @@ static int hym8563_rtc_set_time(struct device *dev, s=
truct rtc_time *tm)
>  	if (ret < 0)
>  		return ret;
> =20
> -	hym8563->valid =3D true;
> -
>  	return 0;
>  }
> =20
> @@ -556,9 +554,8 @@ static int hym8563_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		return ret;
> =20
> -	hym8563->valid =3D !(ret & HYM8563_SEC_VL);
>  	dev_dbg(&client->dev, "rtc information is %s\n",
> -		hym8563->valid ? "valid" : "invalid");
> +		(ret & HYM8563_SEC_VL) ? "invalid" : "valid");
> =20
>  	hym8563->rtc =3D devm_rtc_device_register(&client->dev, client->name,
>  						&hym8563_rtc_ops, THIS_MODULE);
> --=20
> 2.24.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl3yGcgACgkQ3cLmz3+f
v9Fuiwf+NbOWhjtveqEVxSzv5moNBbpclOlxCFRb+48rR/+KD5SlNRuRoba+IUJW
KkqirvfdMiuSzBK06AIYIrWGmD5T24L2Eg7Hv6YHJIznGNdWKL1AytmvXgJzviQR
rig4uI7t70alC0DUvZ18tD8kTxAfCCVsHjSMGmpdqiCg8dn0WqT4vFAn5jw0/Iwg
ZNUGJPmWHAJCri+CG9WDlreCeUZrf2cGgM40yulv3Y6Dy8AQrstFhdrxvvJxonU4
NIJ8yyiH2ntiJkgC+XJDYpy26nLHCsZ+QFUiglEqNM7q0YC8/Z83ek1/sgNbDAct
QnzL6w0qyboAEIOZeWyF31TIaEtCQg==
=qo8+
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--
