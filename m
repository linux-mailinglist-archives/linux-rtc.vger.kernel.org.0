Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6BE910D1A9
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2019 08:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfK2HAR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Nov 2019 02:00:17 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:44840 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbfK2HAR (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 29 Nov 2019 02:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=XUFxHeXPY+Po16LCpmJQMNJk/K05F2Rj6JlfQtegUCI=; b=M0oLNiNCrbelqyV3eMJCSroNV
        5VfHZkvDyXmUxVhc834Q+A47szyOqeBb7c87/JZsHlWpzHJRr3KuZb/Re0ZXCBBoe3AJVkIIpUi8W
        wcigJzc+xevBj/r4tHAay3RTlspipZPFxGWm4JtDZObqgRxTjxNIvshcqF5E6G0vwH0Ks=;
Received: from [2a02:790:ff:919:7ee9:d3ff:fe1f:a246] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iaaG6-0002UI-Ov; Fri, 29 Nov 2019 08:00:10 +0100
Received: from [::1] (helo=localhost)
        by localhost with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iaaFo-0000jl-EO; Fri, 29 Nov 2019 07:59:48 +0100
Date:   Fri, 29 Nov 2019 07:59:40 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     lee.jones@linaro.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        phh@phh.me, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v2 5/5] rtc: rtc-rc5t619: add ricoh rc5t619 RTC driver
Message-ID: <20191129075940.3b1c2631@kemnade.info>
In-Reply-To: <20191128105751.GM299836@piout.net>
References: <20191031213835.11390-1-andreas@kemnade.info>
        <20191031213835.11390-6-andreas@kemnade.info>
        <20191128105751.GM299836@piout.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/89ohO/B5I0jdh09q.AS/jSH"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/89ohO/B5I0jdh09q.AS/jSH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 28 Nov 2019 11:57:51 +0100
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> Hello,
>=20
> checkpatch.pl --strict complains about multiple blank lines and alignment.
>=20
I have not used the strict flag there. But I think I can make
--strict happy.

> On 31/10/2019 22:38:35+0100, Andreas Kemnade wrote:
> > +static int rc5t619_rtc_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct rn5t618 *rn5t618 =3D dev_get_drvdata(pdev->dev.parent);
> > +	struct rc5t619_rtc *rtc;
> > +	uint8_t alarm_flag;
> > +	unsigned int ctrl2;
> > +	int err;
> > +
> > +	rtc =3D devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
> > +	if (IS_ERR(rtc)) {
> > +		err =3D PTR_ERR(rtc);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	rtc->rn5t618 =3D rn5t618;
> > +
> > +	dev_set_drvdata(dev, rtc);
> > +	rtc->irq =3D -1;
> > +
> > +	if (rn5t618->irq_data)
> > +		rtc->irq =3D regmap_irq_get_virq(rn5t618->irq_data,
> > +				RN5T618_IRQ_RTC);
> > +
> > +	if (rtc->irq  < 0) {
> > +		dev_err(dev, "no irq specified, wakeup is disabled\n"); =20
>=20
> I don't think it is worth having an error message here, especially since
> you have a second one later.
>=20
agreed.

> > +		rtc->irq =3D -1;
> > +	}
> > +
> > +	err =3D regmap_read(rtc->rn5t618->regmap, RN5T618_RTC_CTRL2, &ctrl2);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	/* get interrupt flag */
> > +	err =3D rc5t619_rtc_alarm_is_enabled(dev, &alarm_flag);
> > +	if (err)
> > +		return err;
> > +
> > +	/* disable rtc periodic function */
> > +	err =3D rc5t619_rtc_periodic_disable(&pdev->dev);
> > +	if (err)
> > +		return err;
> > +
> > +	/* disable interrupt */
> > +	err =3D rc5t619_rtc_alarm_enable(&pdev->dev, 0);
> > +	if (err)
> > +		return err; =20
>=20
> Is it really useful to disable the alarm to reenable them later?
>=20
Well, yes, seems to be nonsense.
Am I right that I do not need to prevent alarm irqs between
alloc() and register()?

> > +
> > +	if (ctrl2 & CTRL2_PON) {
> > +		alarm_flag =3D 0;
> > +		err =3D rc5t619_rtc_alarm_flag_clr(&pdev->dev);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	rtc->rtc =3D devm_rtc_allocate_device(&pdev->dev);
> > + =20
>=20
> Please remove this blank line.
>=20
Ok.

> > +	if (IS_ERR(rtc->rtc)) {
> > +		err =3D PTR_ERR(rtc->rtc);
> > +		dev_err(dev, "RTC device register: err %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	rtc->rtc->ops =3D &rc5t619_rtc_ops;
> > +	rtc->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_1900;
> > +	rtc->rtc->range_max =3D RTC_TIMESTAMP_END_2099;
> > +
> > +	/* set interrupt and enable it */
> > +	if (rtc->irq !=3D -1) {
> > +		device_init_wakeup(&pdev->dev, 1);
> > +
> > +		err =3D devm_request_threaded_irq(&pdev->dev,
> > rtc->irq, NULL,
> > +						rc5t619_rtc_irq,
> > +						IRQF_ONESHOT,
> > +						"rtc-rc5t619",
> > +						&pdev->dev);
> > +		if (err < 0) {
> > +			dev_err(&pdev->dev, "request IRQ:%d
> > fail\n", rtc->irq);
> > +			rtc->irq =3D -1;
> > +
> > +			err =3D rc5t619_rtc_alarm_enable(&pdev->dev,
> > 0);
> > +			if (err)
> > +				return err;
> > +
> > +		} else {
> > +			/* enable wake */ =20
>=20
> I think you should move device_init_wakeup() here, unless your parse
> the wakeup-source property.
>=20
yes, makes sense.

> > +			enable_irq_wake(rtc->irq);
> > +			/* enable alarm_d */
> > +			err =3D rc5t619_rtc_alarm_enable(&pdev->dev,
> > alarm_flag);
> > +			if (err) {
> > +				dev_err(&pdev->dev, "failed rtc
> > setup\n");
> > +				return -EBUSY;
> > +			}
> > +		}
> > +	} else {
> > +		/* system don't want to using alarm interrupt, so
> > close it */
> > +		err =3D rc5t619_rtc_alarm_enable(&pdev->dev, 0);
> > +		if (err) {
> > +			dev_err(&pdev->dev, "disable rtc alarm
> > error\n"); =20
>=20
> I don't think this message is necessary.
>=20
yes, agreed, that would be just another symptom of an i2c problem.
> > +			return err;
> > +		}
> > +
> > +		dev_err(&pdev->dev, "ricoh61x interrupt is
> > disabled\n"); =20
>=20
> Maybe dev_warn as the driver just continues on.
>=20
Ok.

Regards,
Andreas

--Sig_/89ohO/B5I0jdh09q.AS/jSH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl3gwdwACgkQl4jFM1s/
ye+7HBAAtrx3tG234kWVtzwOYLaouVvIBTJVenn4vrL9or+rf2MQ8HxA1nmujQ0N
DZVOa6ugbxw7GqcyQHkrBrouF/8rv+7svFS45hylZauagNkIdlRL4b8j7wdo5vma
Nim4r8c3ITPzT1FF41thRuY99EOxTzmk10sXIV7n5+KTzardFUOHV4VdJDTDQ/B0
eoLQCJT6bjBUQyt+7uqfUgHB3trA5RNB085GHED/1flvhWgfhY1wCSLsPK8KHsJl
DKt67bgqHpsR9LZ6vbNdQygEByOH5baaNYFX4+C+9p3z6i37PviLYWsajCPso1bX
HbTiW+9pqpLF74HlpkKdjgl3PHxNmSD8K913JMtOt+HOqqMZkiZeMX7YB1wXPemM
L9FUwxSXU9XSgZnCnvcouvmHgBNokWJOIG4Jw0F1ueFt3H5MwiO3fQd3l/R5aUod
jYfSnNe0zOrpxCwCJsBTBXCezVTXZDk/NRr1ia1IsL6et94c9n1gF8q7bnfj3nJx
3CyiwhBRbnIlvsks2n9lW+bXC28PCsuyLUBu4noch/61Q2rAubJ1z4Q/Zsxy2PqF
3X7VYfF/PnTidxBO120sIGq21V0NdCJyLQaTX/DsSt/QLKwc3MMjnPNVMX+YN72f
63ix4qOXs64tvdc3VJEsea4kT66Mqy0SotT17HH8/8+U4NgJKM0=
=kKsG
-----END PGP SIGNATURE-----

--Sig_/89ohO/B5I0jdh09q.AS/jSH--
