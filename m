Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE22EFBC3C
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2019 00:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfKMXIK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Nov 2019 18:08:10 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36785 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfKMXIK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Nov 2019 18:08:10 -0500
Received: by mail-lf1-f67.google.com with SMTP id m6so3363883lfl.3;
        Wed, 13 Nov 2019 15:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CMXle6FOj7sNaEUWjPwsRpDGPjEMhO8gArBWaBc7RnQ=;
        b=KbeO5gt7g5oQmoIzg76ofNu//Cwkn9y66SX1Se9lt/AcOiYd8vSLXDWyaHTyl/UPtB
         7kAIG4iRNeOZYVnHEIDuuAspOMjPC/E0dV/Jgd+jM1QV3AEsUOvMEmp/ynCggay5BJFW
         vRh8HiycH8X4WSUWP3dDy8JVUuHtre3ekbdqML+hU+y5CpW5O7qwzsWEYjf96jT8QBb5
         ucKqRwm+wf62S4nGI6qQeUnSDJKFlHY7G9MfFK7WIBGECHWOA8ppRantclcM50XZXbiy
         WM+uVSn9fu4pPINh4SRgpQYkz9RmHPZJ5F4AnKoTL+rSDHraauhqA4uvaNPJ4X9d3Ng+
         HnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=CMXle6FOj7sNaEUWjPwsRpDGPjEMhO8gArBWaBc7RnQ=;
        b=CMSIjvllRrVzjPr+XtYlYiCTkHPQZka/o0TkbrnLU+pJsT7PQKEAU+GXm8oZX0dvMo
         +zEz+oI9zWgyaQbemXATmn44lLaKHC8DcCNOxNueAhMjaPKZPhUyqoaw9PSDclRRG4pl
         yBPP7IhJfZ+OItU9BzFtnO1u79aFMgm4q9+uiNOL1GDz3pxmSSGAmLJiebYFCTicr20Q
         5KUpVOT0X8N7t2fqKStmeQUVXMPCwVMhv0aN5zYW7Sp/T3YL1bxgJfNtg/IuFDIVhwxN
         /1R6kRVde2K++cKHGySq9ROucneZPbBWHsGQj/eEfVFxd3eh/yOT2nxU/U0c8z9lbQsp
         E75Q==
X-Gm-Message-State: APjAAAXQbinAseu5OyXceWTaklpssGVHsLar5fK3w2yYu8q5uWUHEVnS
        EvLF+atXSNh2VYhE8TLCBqqNTK9y
X-Google-Smtp-Source: APXvYqzrbm6t2mCSCwFrd/Lbp6XX59P4pGigxEcp1BH5sfd5J+QKu5liUfIzdYWUPjC9XK9A2B2dFw==
X-Received: by 2002:a19:494d:: with SMTP id l13mr4557332lfj.66.1573686486865;
        Wed, 13 Nov 2019 15:08:06 -0800 (PST)
Received: from localhost ([188.243.226.168])
        by smtp.gmail.com with ESMTPSA id f24sm1614876lfk.74.2019.11.13.15.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 15:08:05 -0800 (PST)
Date:   Thu, 14 Nov 2019 02:08:05 +0300
From:   Andrey Skvortsov <andrej.skvortzov@gmail.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: tps65910: allow using RTC without alarm interrupt
Message-ID: <20191113230805.GH13629@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191109154652.7419-1-andrej.skvortzov@gmail.com>
 <20191111171915.GA3572@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HYC+c85AsWjroYih"
Content-Disposition: inline
In-Reply-To: <20191111171915.GA3572@piout.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--HYC+c85AsWjroYih
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 19-11-11 18:19, Alexandre Belloni wrote:
> Hi,
>=20
> This needs a proper commit message.

Add in v2.
=20
> On 09/11/2019 18:46:52+0300, Andrey Skvortsov wrote:
> > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> > ---
> >  drivers/rtc/rtc-tps65910.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
> > index 2c0467a9e717..aa3a001ef413 100644
> > --- a/drivers/rtc/rtc-tps65910.c
> > +++ b/drivers/rtc/rtc-tps65910.c
> > @@ -361,6 +361,13 @@ static const struct rtc_class_ops tps65910_rtc_ops=
 =3D {
> >  	.set_offset	=3D tps65910_set_offset,
> >  };
> > =20
> > +static const struct rtc_class_ops tps65910_rtc_ops_noirq =3D {
> > +	.read_time	=3D tps65910_rtc_read_time,
> > +	.set_time	=3D tps65910_rtc_set_time,
> > +	.read_offset	=3D tps65910_read_offset,
> > +	.set_offset	=3D tps65910_set_offset,
> > +};
> > +
> >  static int tps65910_rtc_probe(struct platform_device *pdev)
> >  {
> >  	struct tps65910 *tps65910 =3D NULL;
> > @@ -415,13 +422,17 @@ static int tps65910_rtc_probe(struct platform_dev=
ice *pdev)
> >  		tps65910_rtc_interrupt, IRQF_TRIGGER_LOW,
> >  		dev_name(&pdev->dev), &pdev->dev);
> >  	if (ret < 0) {
> > -		dev_err(&pdev->dev, "IRQ is not free.\n");
> > -		return ret;
> > +		dev_err(&pdev->dev, "request IRQ:%d failed, err =3D %d\n",
> > +			 irq, ret);
>=20
> Do we actually need an error message here?

You are right. This is definitely not an error anymore.
What about
dev_warn(&pdev->dev, "unable to request IRQ, alarms disabled\n");
like some other drivers do?


grep -RHn 'unable to request IRQ, alarms disabled'
rtc-rv8803.c:576:			dev_warn(&client->dev, "unable to request IRQ, alarms d=
isabled\n");
rtc-m41t80.c:914:			dev_warn(&client->dev, "unable to request IRQ, alarms d=
isabled\n");
rtc-rv3028.c:651:			dev_warn(&client->dev, "unable to request IRQ, alarms d=
isabled\n");
rtc-pcf85363.c:416:			dev_warn(&client->dev, "unable to request IRQ, alarms=
 disabled\n");
rtc-pcf85063.c:458:				 "unable to request IRQ, alarms disabled\n");
rtc-rv3029c2.c:828:			dev_warn(dev, "unable to request IRQ, alarms disabled=
\n");
rtc-rx8025.c:540:			dev_err(&client->dev, "unable to request IRQ, alarms di=
sabled\n");
rtc-abx80x.c:839:			dev_err(&client->dev, "unable to request IRQ, alarms di=
sabled\n");


>=20
> > +		irq =3D -1;
> >  	}
> >  	tps_rtc->irq =3D irq;
> > -	device_set_wakeup_capable(&pdev->dev, 1);
> > +	if (irq !=3D -1) {
> > +		device_set_wakeup_capable(&pdev->dev, 1);
> > +		tps_rtc->rtc->ops =3D &tps65910_rtc_ops;
> > +	} else
> > +		tps_rtc->rtc->ops =3D &tps65910_rtc_ops_noirq;
> > =20
> > -	tps_rtc->rtc->ops =3D &tps65910_rtc_ops;
> >  	tps_rtc->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> >  	tps_rtc->rtc->range_max =3D RTC_TIMESTAMP_END_2099;
> > =20
> > --=20
> > 2.20.1
> >=20
>=20
> --=20
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--=20
Best regards,
Andrey Skvortsov

--HYC+c85AsWjroYih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ575tvhxWSXeo3tPAXzLovVIsK0FAl3MjM8ACgkQAXzLovVI
sK1lPxAAvSdgY5bOXPlM53wypSyBxGTbjygKd3QmKLR+vK9Oj+RnmCkWM3IML1Kc
TsaGKqqinXuiTi5xCV5aH0MTNetcFkqvr2yrQ0oQYLqBKQcF2rwgV6h4FHsai4Jd
30s4sbXB5Pr2VI2DWWo9WwQwS4tj4llNiFvKJzaPX9OSWOOOfyBMjrdx0ht4S+cx
DsJrGyMzkuVhwHgagsN0j2KAr+aPqDW8kWof01jHVJFnUCiTawr9UWo5WREMA2ex
8lpvICaIEAqouXrtG3F3rK0UBqXapYtVwRwOcGF0TmlExpz+OFYmph2caUx7EwUr
QsHRECRDpmKOad2dDZ0EcyyYk+AdCfHAEnsFOvN5TnjATNgB0tR9v9HAg9IZ+79b
TisDorXh+Lco2l0NMVsVxB9xBepBLhyKIA4PYychMPwrylVHc7CyooQkWBccB9Gv
8hB/wjjlS4y/DhSh00WbZHcdYRA7uCbdbPE8G/rCzfPbdmui3pICxKRHL4sWDqrv
xOiNKm/Bv+01JLmzehs9HeNoI1UTCAAmBpy/y1/hJwLanxAq7htSkddn6UCj2b8K
RtxnN0EAa9yq9m+3+DdtCraG7Jh4OVn8RqW28Av/VpXdrj1Nar8Y13BKZ5pTugiU
6JPbNlt3BBeZZITRkBsE0uPDIMNh8AeFOVh0oD+s0AFsi6gHbN0=
=V66C
-----END PGP SIGNATURE-----

--HYC+c85AsWjroYih--
