Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87E6B6AD903
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Mar 2023 09:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjCGIRz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 7 Mar 2023 03:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjCGIRp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 7 Mar 2023 03:17:45 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E8B4FF06
        for <linux-rtc@vger.kernel.org>; Tue,  7 Mar 2023 00:17:25 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZSVf-0003g3-A5; Tue, 07 Mar 2023 09:17:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZSPo-002RD0-7m; Tue, 07 Mar 2023 09:11:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZSPn-002vVr-2U; Tue, 07 Mar 2023 09:11:19 +0100
Date:   Tue, 7 Mar 2023 09:11:18 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH 11/41] rtc: ds1685: Convert to platform remove callback
 returning void
Message-ID: <20230307081118.rociwbzuk6dl7fwu@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
 <20230304133028.2135435-12-u.kleine-koenig@pengutronix.de>
 <9e2df07f-92d3-966a-5092-22572e102253@gentoo.org>
 <20230306212218.qzer65c74rb7d6yy@pengutronix.de>
 <00ee8bf1-478b-fdba-7938-221dbefd40f2@gentoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="huvkd5elad3satji"
Content-Disposition: inline
In-Reply-To: <00ee8bf1-478b-fdba-7938-221dbefd40f2@gentoo.org>
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


--huvkd5elad3satji
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Joshua,

On Mon, Mar 06, 2023 at 09:09:03PM -0500, Joshua Kinard wrote:
> On 3/6/2023 16:22, Uwe Kleine-K=F6nig wrote:
> > On Mon, Mar 06, 2023 at 02:43:20PM -0500, Joshua Kinard wrote:
> > > On 3/4/2023 08:29, Uwe Kleine-K=F6nig wrote:
> > > > The .remove() callback for a platform driver returns an int which m=
akes
> > > > many driver authors wrongly assume it's possible to do error handli=
ng by
> > > > returning an error code. However the value returned is (mostly) ign=
ored
> > > > and this typically results in resource leaks. To improve here there=
 is a
> > > > quest to make the remove callback return void. In the first step of=
 this
> > > > quest all drivers are converted to .remove_new() which already retu=
rns
> > > > void.
> > > >=20
> > > > Trivially convert this driver from always returning zero in the rem=
ove
> > > > callback to the void returning variant.
> > > >=20
> > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > ---
> > > >    drivers/rtc/rtc-ds1685.c | 6 ++----
> > > >    1 file changed, 2 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> > > > index 5db9c737c022..0f707be0eb87 100644
> > > > --- a/drivers/rtc/rtc-ds1685.c
> > > > +++ b/drivers/rtc/rtc-ds1685.c
> > > > @@ -1322,7 +1322,7 @@ ds1685_rtc_probe(struct platform_device *pdev)
> > > >     * ds1685_rtc_remove - removes rtc driver.
> > > >     * @pdev: pointer to platform_device structure.
> > > >     */
> > > > -static int
> > > > +static void
> > > >    ds1685_rtc_remove(struct platform_device *pdev)
> > > >    {
> > > >    	struct ds1685_priv *rtc =3D platform_get_drvdata(pdev);
> > > > @@ -1344,8 +1344,6 @@ ds1685_rtc_remove(struct platform_device *pde=
v)
> > > >    	rtc->write(rtc, RTC_EXT_CTRL_4A,
> > > >    		   (rtc->read(rtc, RTC_EXT_CTRL_4A) &
> > > >    		    ~(RTC_CTRL_4A_RWK_MASK)));
> > > > -
> > > > -	return 0;
> > > >    }
> > > >    /*
> > > > @@ -1356,7 +1354,7 @@ static struct platform_driver ds1685_rtc_driv=
er =3D {
> > > >    		.name	=3D "rtc-ds1685",
> > > >    	},
> > > >    	.probe		=3D ds1685_rtc_probe,
> > > > -	.remove		=3D ds1685_rtc_remove,
> > > > +	.remove_new	=3D ds1685_rtc_remove,
> > > >    };
> > > >    module_platform_driver(ds1685_rtc_driver);
> > > >    /* -------------------------------------------------------------=
---------- */
> > >=20
> > > Is there a future planned patch that would remove the .remove member
> > > and then rename .remove_new --> .remove?
> >=20
> > The eventual plan is to do
> >=20
> > diff --git a/include/linux/platform_device.h b/include/linux/platform_d=
evice.h
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index 77510e4f47de..1c65943d6b53 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -1420,14 +1420,8 @@ static void platform_remove(struct device *_dev)
> >   	struct platform_driver *drv =3D to_platform_driver(_dev->driver);
> >   	struct platform_device *dev =3D to_platform_device(_dev);
> > -	if (drv->remove_new) {
> > -		drv->remove_new(dev);
> > -	} else if (drv->remove) {
> > -		int ret =3D drv->remove(dev);
> > -
> > -		if (ret)
> > -			dev_warn(_dev, "remove callback returned a non-zero value. This wil=
l be ignored.\n");
> > -	}
> > +	if (drv->remove)
> > +		drv->remove(dev);
> >   	dev_pm_domain_detach(_dev, true);
> >   }
> > index b845fd83f429..8c5fdaa8645f 100644
> > --- a/include/linux/platform_device.h
> > +++ b/include/linux/platform_device.h
> > @@ -209,15 +209,16 @@ struct platform_driver {
> >   	int (*probe)(struct platform_device *);
> >   	/*
> > -	 * Traditionally the remove callback returned an int which however is
> > +	 * Traditionally the remove callback returned an int which however was
> >   	 * ignored by the driver core. This led to wrong expectations by dri=
ver
> >   	 * authors who thought returning an error code was a valid error
> > -	 * handling strategy. To convert to a callback returning void, new
> > -	 * drivers should implement .remove_new() until the conversion it done
> > -	 * that eventually makes .remove() return void.
> > +	 * handling strategy. .remove_new is a hangover from these times which
> > +	 * will be dropped once all drivers are converted to .remove().
> >   	 */
> > -	int (*remove)(struct platform_device *);
> > -	void (*remove_new)(struct platform_device *);
> > +	union {
> > +		void (*remove)(struct platform_device *);
> > +		void (*remove_new)(struct platform_device *);
> > +	};
> >   	void (*shutdown)(struct platform_device *);
> >   	int (*suspend)(struct platform_device *, pm_message_t state);
> >=20
> > and then once all the drivers are converted back to .remove() drop the
> > union and .remove_new().
> >=20
> > Best regards
> > Uwe
> >=20
>=20
> This looks like a pretty simple/minor API change.  Why not just do a patch
> series that makes both the API change and updates all of the drivers at o=
nce
> (one commit per driver)?

A bit of statistic: Based on v6.3-rc1 I have 2286 patches like the ones
=66rom this series that (mostly) convert drivers that today already return
zero unconditionally. Then there is my todo-list of ~100 additional
drivers that don't return 0 that need manual inspection and fixing.

So we're talking about 2300+ drivers in all subsystems here. To get a
bisectable series that does the complete conversion, we need:

	2300 patches to convert drivers to .remove_new()
	the above patch
	2300 patches to convert drivers back to the new .remove()

Last time I sent a series with ~640 patches (for a similar conversion
for i2c drivers) people were unlucky already and I got tons of bounces.
Please consider the address list for the cover letter. While most
patches are trivial this would require a massive coordination.

So no, this isn't a sensible suggestion. I'll continue to send out
conversions to .remove_new() per subsystem and once most of them are
converted, the above patch will be sent with the remainder of the
unapplied patches.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--huvkd5elad3satji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQG8aMACgkQwfwUeK3K
7AkK4gf+O4dk7p3DnxecP9CyqI1yiTvnGd7x+AoPp7TAcTabBsycZfAva3SQWKiU
39YHLE9mmZ/3/9ROME73WZJnQqYOoygZEmOxewox7u1A7sPfKLuUA4A5VgqCiVBK
ul2lndTfbeDU/pNaH74cQLxgY3KQQjl35UlOhF7lCh5z10r4tWI93dM26w6bPCL8
zGLAinNQpD0n1t/z4LNQzQVtvRFGGqCq0P/0MdOMZ8Of/rWQt9auQ2TJPy4aZXOk
W6ofIUieOUsQay/Yo1m+qDRmt5As9jmcRiWF1xqB5PtcDE2tkJVGckYn8t5LJsJr
a9WNgZ3W0qNqhkHOlZySNGoXKlcm4A==
=uY6f
-----END PGP SIGNATURE-----

--huvkd5elad3satji--
