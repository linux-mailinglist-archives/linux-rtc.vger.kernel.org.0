Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 097A2E3D26
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2019 22:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfJXUZn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Oct 2019 16:25:43 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:52918 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727341AbfJXUZn (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 24 Oct 2019 16:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=s386dnBU1HIFmNalEIyqVe2FQlFKuOkejyFhnPXRhfM=; b=IMCfY6kBViZRvKe/n3env9WyS
        HxzKMdgfz4BwhMXAoCr8ouYrFsTfssuTts+3GAvKu1LhJ+vBentyZ3T83LM2m9dCQM8zLY7rT/M9f
        /RVPPOc34lupAOsVEtBrmMvPu6mPBTqBrFc/28/tAxyBSEsWNlHERgOfaYYGe/HaFSxQk=;
Received: from p200300ccff0ef3007ee9d3fffe1fa246.dip0.t-ipconnect.de ([2003:cc:ff0e:f300:7ee9:d3ff:fe1f:a246] helo=eeepc)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iNjfu-0004K0-EV; Thu, 24 Oct 2019 22:25:38 +0200
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iNjft-0007n7-7k; Thu, 24 Oct 2019 22:25:37 +0200
Date:   Thu, 24 Oct 2019 22:25:24 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     lee.jones@linaro.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        phh@phh.me, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH 5/5] rtc: rtc-rc5t583: add ricoh rc5t619 RTC driver
Message-ID: <20191024222524.5c0ac910@kemnade.info>
In-Reply-To: <20191023231717.GU3125@piout.net>
References: <20191021054104.26155-1-andreas@kemnade.info>
        <20191021054104.26155-6-andreas@kemnade.info>
        <20191021101528.GU3125@piout.net>
        <20191021231359.1cada218@kemnade.info>
        <20191023231717.GU3125@piout.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YUm7HBtjzJ3_gH4cRnCtE/5"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/YUm7HBtjzJ3_gH4cRnCtE/5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 24 Oct 2019 01:17:17 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> On 21/10/2019 23:13:59+0200, Andreas Kemnade wrote:
> > > > + * Based on code
> > > > + *  Copyright (C) 2012-2014 RICOH COMPANY,LTD
> > > > + *
> > > > + * Based on code
> > > > + *  Copyright (C) 2011 NVIDIA Corporation   =20
> > >=20
> > > Based on is not useful.
> > >  =20
> > Well, ok, I guess 90 % of the lines are rewritten by me.
> > So I could remove all that Based on copyright notices?
> >  =20
>=20
> Yes
>=20
> > > Also what is that adjusting? If this is adding/removing clock cycles,
> > > you need to use .set_offset and .read_offset.
> > >  =20
> > It the moment I am just clearing it at init. Since I do not know the
> > exact meaning of the value, I am not offering it through set_offset/rea=
d_offset.
> >  =20
>=20
> It is actually kind of an issue to clear it because it may have been set
> to a useful value. Anyway, I understand you don't know much about the
> register...
>=20
Or to some nonsense. The reason I am clearing it is that the original driver
is doing that and is also exporting it via sysfs. But I could reduce it to=
=20
clearing it at PON condition, then chances are low that there is something
important in there.

> > > > +}
> > > > +
> > > > +static int rc5t619_rtc_pon_get_clr(struct device *dev, uint8_t *po=
n_f)
> > > > +{
> > > > +	struct rc5t619_rtc *rtc =3D dev_get_drvdata(dev);
> > > > +	int err;
> > > > +	unsigned int reg_data;
> > > > +
> > > > +	err =3D regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL2, &reg=
_data);
> > > > +	if (err < 0)
> > > > +		return err;
> > > > +
> > > > +	if (reg_data & CTRL2_PON) {
> > > > +		*pon_f =3D 1;
> > > > +		/* clear VDET PON */
> > > > +		reg_data &=3D ~(CTRL2_PON | CTRL2_CTC | 0x4a);	/* 0101-1011 */
> > > > +		reg_data |=3D 0x20;	/* 0010-0000 */   =20
> > >=20
> > > Is it possible to have more defines for those magic values?
> > >  =20
> > Well, I only have some GPLed source code as documentation, no good docu=
mentation.
> > So I only know that one bit must be VDET.
> > rtc-rc5t583 seems not to be helpful to find these magic numbers.
> > 0x40 might be VDET. At least that is conform with rtc-rs5c348.c.
> > rc5t583 seems not to know a VDET.
> > But there seems to be no clear duplicate anywhere of those two
> > ctrl registers. It seems that the rc5t619 is a cross of everything, hav=
ing
> > 6 byte bcd time in common with everything.=20
> > So we have to keep a bit of magic here.
> >  =20
>=20
> It would be very useful to be able to detect voltage drop. Also PON is a
> useful information that is lost when probing the driver. You
> definitively know the time is incorrect after power on and this should
> be reset only after setting the time at least once (the same for voltage
> drop).
>=20
So returing -EIO in read_time and clearing things only after set_time?

Do you see tha VDET issue as a blocker for accepting this driver?
I agree it might be useful. But IMHO it is too much guesswork and hard to t=
est.
But contrary to the other bits used with a clear name it would be pure gues=
swork
and hard to test. =20

> > > > +		cent_flag =3D 1;
> > > > +	else
> > > > +		cent_flag =3D 0;
> > > > +
> > > > +	buff[5] =3D buff[5] & 0x1f;		/* bit5 19_20 */   =20
> > >=20
> > > This assignment is unnecessary, you can mask the value when using it.
> > >  =20
> > ok.
> >  =20
> > > Is the RTC 1900-2099 or 2000-2199? Please include the ouput of rtc-ra=
nge
> > > in the commit log:
> > >=20
> > > https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.gi=
t/tree/rtc-range.c
> > >  =20
> > # ./rtc-range=20
> >=20
> > Testing 2000-02-28 23:59:59.
> > OK
> >=20
> > Testing 2038-01-19 03:14:07.
> > OK
> >=20
> > Testing 2069-12-31 23:59:59.
> > OK
> >=20
> > Testing 2099-12-31 23:59:59.
> > KO RTC_RD_TIME returned 22 (line 138)
> >=20
> > Testing 2100-02-28 23:59:59.
> > KO RTC_RD_TIME returned 22 (line 138)
> >=20
> > Testing 2106-02-07 06:28:15.
> > OK
> >=20
> > Testing 2262-04-11 23:47:16.
> > KO  Read back 2102-04-11 23:47:16.
> >=20
> > I think it is 1900 to 2099.
> >  =20
>=20
> It is, I'm very curious to know why it doesn't roll over properly from
> 2099-12-31 23:59:59 to 1900-01-01 00:00:00.
>=20
> You can set range_min and range_max accordingly.
>=20
yes, will do.

> > > > +	if (rtc->irq =3D=3D -1)
> > > > +		return -EIO;   =20
> > >=20
> > > This has to be -EINVAL to get UIE emulation working.
> > > =20
> > so then ordinary hwclock still works without irq?
> >   =20
>=20
> Yes
>=20
> > > > +	/* using 24h-mode */
> > > > +	err =3D rc5t619_rtc_24hour_mode_set(&pdev->dev, 1);
> > > > +   =20
> > >=20
> > > Doesn't that corrupt the time if the RTC was previously set in 12h-mo=
de?
> > >=20
> > >  =20
> > Probably it can. but probably that is only important in a multi-boot sc=
enario but
> > who knows... If that is important enough I can try to implement 12h mod=
e.
> >=20
> > Is there any testing tool for 12h vs. 24h? Or should I expand
> > rtc-range.c? BTW: apparently rtc-rc5t583.c seems not to properly care
> > about 24h mode too, so I took a bad example. Well, not tested that...
> >  =20
>=20
> There is no specific test because reading any time in the afternoon
> would fail if there is a mismatch. The correct way to handle this would
> be to support both 12h and 24h mode in read_time and always set 24h mode
> in set_time instead of setting it at probe time.
>=20
I would expect undefined behavior, not necessarily a fail. Interesting
things will happen the next time the hour register is touched.
If you assume that the scenario with other users in 12h mode is important
enough to consider, then you are right, supporting both 12h and 24h in read=
_time
is better. About always set 24h: If there is some other user only prepared =
for
12h mode, there will be trouble. Also we might need to reconfigure an alarm
to the selected mode.

I guess setting 24h mode at PON and checking at every time and alarm read/w=
rite
what mode we are in. Then we do not need to reprogram alarm.

What driver is doing 24h/12h in a good way, just as a good example?

> People usually forget that the RTC is still running while Linux is not.
> So for an RTC driver, it is a bad idea to do initialization at every
> probe, unlike many other peripheral.
>=20
> > > > +static int rc5t619_rtc_remove(struct platform_device *pdev)
> > > > +{
> > > > +	rc5t619_rtc_alarm_enable(&pdev->dev, 0);   =20
> > >=20
> > > If the PMIC can be used to start the platform, you probably don't want
> > > to disable the alarm here. Even if it doesn't, is it actually useful =
to
> > > disable the alarm?
> > >  =20
> >=20
> > well, I think this is not executed if you do
> > rtcwake -m off -s something
> > At least my device powers on after that.
> >  =20
>=20
> This is waking from suspend, I was thinking powering up the platform.
>=20
well, -m mem is waking from suspend
-m off is halt

man rtcwake says:

              off    ACPI state S5 (Poweroff).  This is done by calling
              '/sbin/shutdown'.  Not officially supported by ACPI, but
              it usually works.


testing
rtcwake -s 60 -m no
halt

it powers on successfully.

but
rtcwake -s 60 -m no
cd /sys/bus/platform/drivers/rc5t619-rtc
echo rc5t619-rtc >unbind
halt

does *not* power on. So only here .remove is called.

But that is just for understanding what we are doing here.
It is more important to have a common behavior across drivers.

> > Somehow I expect the driver to clean up there. e.g. rc5t583 does that, =
too.
> > But no strong opinion here.
> >  =20
>=20
So it seems that I have found a driver doing something uncommon here an
an example.

> Again, the RTC is still running after a shutdown (which will run the
> .remove callback). Disabling the alarm means that it will not fire while
> linux is not running I'm not sure what the upside is. But this prevents
> the RTC from starting the system if someone uses the alarm pin to do
> that.
>=20
As said disabling alarm at this place means not disabling alarm at shutdown
but think it is simply not necessary.

> Also, having an alarm set means that userspace did it intentionally. The
> driver removing the alarm is not something that is expected.
>=20
Well, at least it is userspace job to disable it at shutdown if the device=
=20
hould not wake up. And it is UI job to make clear to user what kind of alarm
is enabled.

Regards,
Andreas

--Sig_/YUm7HBtjzJ3_gH4cRnCtE/5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl2yCLYACgkQl4jFM1s/
ye8s8w//SSALYnFK5G40hSSK5MMS51CASryOWLG0HwcnnoKaNJG1XXbsFkPLbPhA
4zXufD4vfYYYvyyGQqNCZdoc9D/2kxL7Gmxc1kLd8gXj0Cnf5s1wqYGaNwJv/wSP
ZQMY0pM/7I2cj7tEWnlU5RmS2JzliBTuR9ID5um78WxrARuE5031UgEkFt/mlgv2
Fll1S64r8z2zXo6tU5aeUPV+t69yDAq/U6IFNqd1ofr18VSPn4rtqa7YoswFr65j
pAbrJ9oDFL51LaSKZHi46yq/tjJQFF9OY1S6Vvm2hEhKfdueJxg/v+2F2w7puuVc
oNasnEEY2f47L0y1dzWLVbraALq4zo7BCMQi5wqlLnNASKDUCJSu4INkjM8qbirc
cClfdClxU167IHW5M46+kBFvpZaKPdkD5YbDE4wIGtOli8kCbM/QpF+dL8PWlG4G
/Qar/c9tIc4DRyXpyvdU5kXmyrUrNNipNVeIgv/gbHQIPJfL/23yv+jVK9/FMc01
m0JMuz+KBBp3uGD3wSSMWsLF3SOOZZ799ZXvhiFUTxGtTlaW3Wwpc5Ja7Nybny5h
eshy32jMhPg6vsKosxcWgw7Bpjih8KygTgTC9HVlnBVBagGxLNyEzIYhM48Zwdwh
n6HMKtHQl9OyXFCsue0WfGiC6RFpVYAU2WRnXGoFGpiiebDR8XY=
=c1CG
-----END PGP SIGNATURE-----

--Sig_/YUm7HBtjzJ3_gH4cRnCtE/5--
