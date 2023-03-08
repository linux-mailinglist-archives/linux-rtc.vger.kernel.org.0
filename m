Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEBB6B0F28
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Mar 2023 17:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjCHQsB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 Mar 2023 11:48:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjCHQr7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 8 Mar 2023 11:47:59 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DFC1BFE
        for <linux-rtc@vger.kernel.org>; Wed,  8 Mar 2023 08:47:53 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZwxE-0008Uc-5I; Wed, 08 Mar 2023 17:47:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZwxD-002l4G-3C; Wed, 08 Mar 2023 17:47:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZwxC-003KvU-GC; Wed, 08 Mar 2023 17:47:50 +0100
Date:   Wed, 8 Mar 2023 17:47:50 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH 11/41] rtc: ds1685: Convert to platform remove callback
 returning void
Message-ID: <20230308164750.x4ozcdxymcqoz73m@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
 <20230304133028.2135435-12-u.kleine-koenig@pengutronix.de>
 <9e2df07f-92d3-966a-5092-22572e102253@gentoo.org>
 <20230306212218.qzer65c74rb7d6yy@pengutronix.de>
 <00ee8bf1-478b-fdba-7938-221dbefd40f2@gentoo.org>
 <20230307081118.rociwbzuk6dl7fwu@pengutronix.de>
 <ac8895ab-68cb-1250-199e-4758e44e740a@gentoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t53yjoh6phfswzk5"
Content-Disposition: inline
In-Reply-To: <ac8895ab-68cb-1250-199e-4758e44e740a@gentoo.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--t53yjoh6phfswzk5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Joshua,

On Wed, Mar 08, 2023 at 11:20:34AM -0500, Joshua Kinard wrote:
> On 3/7/2023 03:11, Uwe Kleine-K=F6nig wrote:
> > On Mon, Mar 06, 2023 at 09:09:03PM -0500, Joshua Kinard wrote:
> > > On 3/6/2023 16:22, Uwe Kleine-K=F6nig wrote:
> > > > On Mon, Mar 06, 2023 at 02:43:20PM -0500, Joshua Kinard wrote:
> > > > > On 3/4/2023 08:29, Uwe Kleine-K=F6nig wrote:
> > > > > > The .remove() callback for a platform driver returns an int whi=
ch makes
> > > > > > many driver authors wrongly assume it's possible to do error ha=
ndling by
> > > > > > returning an error code. However the value returned is (mostly)=
 ignored
> > > > > > and this typically results in resource leaks. To improve here t=
here is a
> > > > > > quest to make the remove callback return void. In the first ste=
p of this
> > > > > > quest all drivers are converted to .remove_new() which already =
returns
> > > > > > void.
> > > > > >=20
> > > > > > Trivially convert this driver from always returning zero in the=
 remove
> > > > > > callback to the void returning variant.
> > > > > >=20
> > > > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.=
de>
> > > > > > ---
> > > > > >     drivers/rtc/rtc-ds1685.c | 6 ++----
> > > > > >     1 file changed, 2 insertions(+), 4 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> > > > > > index 5db9c737c022..0f707be0eb87 100644
> > > > > > --- a/drivers/rtc/rtc-ds1685.c
> > > > > > +++ b/drivers/rtc/rtc-ds1685.c
> > > > > > @@ -1322,7 +1322,7 @@ ds1685_rtc_probe(struct platform_device *=
pdev)
> > > > > >      * ds1685_rtc_remove - removes rtc driver.
> > > > > >      * @pdev: pointer to platform_device structure.
> > > > > >      */
> > > > > > -static int
> > > > > > +static void
> > > > > >     ds1685_rtc_remove(struct platform_device *pdev)
> > > > > >     {
> > > > > >     	struct ds1685_priv *rtc =3D platform_get_drvdata(pdev);
> > > > > > @@ -1344,8 +1344,6 @@ ds1685_rtc_remove(struct platform_device =
*pdev)
> > > > > >     	rtc->write(rtc, RTC_EXT_CTRL_4A,
> > > > > >     		   (rtc->read(rtc, RTC_EXT_CTRL_4A) &
> > > > > >     		    ~(RTC_CTRL_4A_RWK_MASK)));
> > > > > > -
> > > > > > -	return 0;
> > > > > >     }
> > > > > >     /*
> > > > > > @@ -1356,7 +1354,7 @@ static struct platform_driver ds1685_rtc_=
driver =3D {
> > > > > >     		.name	=3D "rtc-ds1685",
> > > > > >     	},
> > > > > >     	.probe		=3D ds1685_rtc_probe,
> > > > > > -	.remove		=3D ds1685_rtc_remove,
> > > > > > +	.remove_new	=3D ds1685_rtc_remove,
> > > > > >     };
> > > > > >     module_platform_driver(ds1685_rtc_driver);
> > > > > >     /* --------------------------------------------------------=
--------------- */
> > > > >=20
> > > > > Is there a future planned patch that would remove the .remove mem=
ber
> > > > > and then rename .remove_new --> .remove?
> > > >=20
> > > > The eventual plan is to do
> > > >=20
> > > > diff --git a/include/linux/platform_device.h b/include/linux/platfo=
rm_device.h
> > > > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > > > index 77510e4f47de..1c65943d6b53 100644
> > > > --- a/drivers/base/platform.c
> > > > +++ b/drivers/base/platform.c
> > > > @@ -1420,14 +1420,8 @@ static void platform_remove(struct device *_=
dev)
> > > >    	struct platform_driver *drv =3D to_platform_driver(_dev->driver=
);
> > > >    	struct platform_device *dev =3D to_platform_device(_dev);
> > > > -	if (drv->remove_new) {
> > > > -		drv->remove_new(dev);
> > > > -	} else if (drv->remove) {
> > > > -		int ret =3D drv->remove(dev);
> > > > -
> > > > -		if (ret)
> > > > -			dev_warn(_dev, "remove callback returned a non-zero value. This=
 will be ignored.\n");
> > > > -	}
> > > > +	if (drv->remove)
> > > > +		drv->remove(dev);
> > > >    	dev_pm_domain_detach(_dev, true);
> > > >    }
> > > > index b845fd83f429..8c5fdaa8645f 100644
> > > > --- a/include/linux/platform_device.h
> > > > +++ b/include/linux/platform_device.h
> > > > @@ -209,15 +209,16 @@ struct platform_driver {
> > > >    	int (*probe)(struct platform_device *);
> > > >    	/*
> > > > -	 * Traditionally the remove callback returned an int which howeve=
r is
> > > > +	 * Traditionally the remove callback returned an int which howeve=
r was
> > > >    	 * ignored by the driver core. This led to wrong expectations b=
y driver
> > > >    	 * authors who thought returning an error code was a valid error
> > > > -	 * handling strategy. To convert to a callback returning void, new
> > > > -	 * drivers should implement .remove_new() until the conversion it=
 done
> > > > -	 * that eventually makes .remove() return void.
> > > > +	 * handling strategy. .remove_new is a hangover from these times =
which
> > > > +	 * will be dropped once all drivers are converted to .remove().
> > > >    	 */
> > > > -	int (*remove)(struct platform_device *);
> > > > -	void (*remove_new)(struct platform_device *);
> > > > +	union {
> > > > +		void (*remove)(struct platform_device *);
> > > > +		void (*remove_new)(struct platform_device *);
> > > > +	};
> > > >    	void (*shutdown)(struct platform_device *);
> > > >    	int (*suspend)(struct platform_device *, pm_message_t state);
> > > >=20
> > > > and then once all the drivers are converted back to .remove() drop =
the
> > > > union and .remove_new().
> > > >=20
> > > > Best regards
> > > > Uwe
> > > >=20
> > >=20
> > > This looks like a pretty simple/minor API change.  Why not just do a =
patch
> > > series that makes both the API change and updates all of the drivers =
at once
> > > (one commit per driver)?
> >=20
> > A bit of statistic: Based on v6.3-rc1 I have 2286 patches like the ones
> > from this series that (mostly) convert drivers that today already return
> > zero unconditionally. Then there is my todo-list of ~100 additional
> > drivers that don't return 0 that need manual inspection and fixing.
> >=20
> > So we're talking about 2300+ drivers in all subsystems here. To get a
> > bisectable series that does the complete conversion, we need:
> >=20
> > 	2300 patches to convert drivers to .remove_new()
> > 	the above patch
> > 	2300 patches to convert drivers back to the new .remove()
> >=20
> > Last time I sent a series with ~640 patches (for a similar conversion
> > for i2c drivers) people were unlucky already and I got tons of bounces.
> > Please consider the address list for the cover letter. While most
> > patches are trivial this would require a massive coordination.
> >=20
> > So no, this isn't a sensible suggestion. I'll continue to send out
> > conversions to .remove_new() per subsystem and once most of them are
> > converted, the above patch will be sent with the remainder of the
> > unapplied patches.
>=20
> I was actually thinking more along the lines of doing one patch series per
> subsystem, so for RTC, ~160 patches, one per rtc-*.c driver making the
> change to have .remove() be void, plus a patch to adjust the struct
> platform_driver rtc definition itself.

The problem is that all subsystems use the same struct platform_driver.
So I cannot change it for rtc and then in the next development cycle for
(say) iio and i2c.

> That way you don't have to have that
> interval period where drivers are carrying around the .remove_new() metho=
d,
> cause I've seen instances in the past where such large-scale changes could
> not be completed in a single kernel development cycle.

Different maintainers seem to have different preferences, but most
prefer one patch per driver. And I don't plan to complete the conversion
in a single development cycle.

> But it sounds like you've already got a plan worked out, so your call on =
how
> you want to handle this.  Thanks for the additional clarification!
>=20
> Acked-By: Joshua Kinard <kumba@gentoo.org>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t53yjoh6phfswzk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQIvDMACgkQwfwUeK3K
7Amozgf/WNEmMYXDhALuGtRAmN94thMjvydq6cnqxTmkzIf7QDte4qgRp/aXShyc
k0MAW1KO68Ue1aAuIvms3DRkrOZ3UMxOrqXw8Qz4+ISLyW7N9hlBMolfUdWoHghf
cHh9JOM4iCV5xZBQsEf1CK9KEdqvnxZFYMzSMzhP9e9vlFksZC1U/kbHQ50ZrQbi
ppi/B/1DgWpTzmKEXvKNnxqrIP0gWmsghjhbBO4F8UZkuRDAsLqp8gPFsq5bmFuP
RnvDWX4RI0MiHeIN7l27ITyd6Mxr0wQ/jCrOy5Qh94S4O13ZiDoBSYJTndjCsXlL
OguvV76FDOILa/yMwUUOH9w1enK64g==
=tsT0
-----END PGP SIGNATURE-----

--t53yjoh6phfswzk5--
