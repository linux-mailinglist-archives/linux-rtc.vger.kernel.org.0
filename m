Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45CC5DF132
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 17:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbfJUPVq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 11:21:46 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:49222 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728044AbfJUPVq (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Oct 2019 11:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ive50pzx0WvHvVBcHs4Tzw6cThZ+6wdZ4fZseJxKh6Y=; b=ayXC65dyk+YOSvIqBmmJY2x7V
        TWyVZxCtI01zsfw8AMN+8dQ+LYmDlCY3KB+73mt7MI2Vge8+mDP4wN2edfxFs3eE9vYplJfCXX5Xx
        Nxh/VXE1kITiMjPNGqK6LiU9HvidAyB0U85G4md1nV1yt5NED5oEsyuPiEThoNfI1i2a8=;
Received: from ip-109-41-64-49.web.vodafone.de ([109.41.64.49] helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMZV8-0001G7-Rs; Mon, 21 Oct 2019 17:21:43 +0200
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMZV5-0001HV-EV; Mon, 21 Oct 2019 17:21:39 +0200
Date:   Mon, 21 Oct 2019 17:20:55 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Stefan Agner <stefan@agner.ch>, lee.jones@linaro.org,
        a.zummo@towertech.it, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, phh@phh.me, b.galvani@gmail.com,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH 5/5] rtc: rtc-rc5t583: add ricoh rc5t619 RTC driver
Message-ID: <20191021172055.2fa66549@kemnade.info>
In-Reply-To: <20191021135028.GV3125@piout.net>
References: <20191021054104.26155-1-andreas@kemnade.info>
        <20191021054104.26155-6-andreas@kemnade.info>
        <d59b7e21112ac96a2d88ae623eb523fc@agner.ch>
        <20191021135028.GV3125@piout.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uCseBc73aLEs0S5AZO0JIAC"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/uCseBc73aLEs0S5AZO0JIAC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Oct 2019 15:50:28 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> On 21/10/2019 15:19:09+0200, Stefan Agner wrote:
> > On 2019-10-21 07:41, Andreas Kemnade wrote: =20
> > > Add an RTC driver for the RTC device on Ricoh MFD rc5t619,
> > > which is implemented as a variant of rn5t618
> > >=20
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > ---
> > >  drivers/rtc/Kconfig       |  10 +
> > >  drivers/rtc/Makefile      |   1 +
> > >  drivers/rtc/rtc-rc5t619.c | 476 ++++++++++++++++++++++++++++++++++++=
++++++++++ =20
> >=20
> > Parts of this driver look very similar to drivers/rtc/rtc-rc5t583.c. Can
> > it maybe shared?
> >  =20
>=20
> If this could be done it would be better. I can't find any public
> datasheet though...
>=20
at least they have different alarm configurations, The rc5t619 can specify
alarm in seconds, the rc5t583 not but has other alarm configurations which
are not present in the rn5t619 (judging by the lack of unused registers whe=
re
thoes information could be filled in).=20

Register addresses do not match.
Some details seem to be the same like century flag.
Interestingly the rc5t583 driver does not care about 12h/24h mode.
So there is a bug there.=20

Regards,
Andreas

--Sig_/uCseBc73aLEs0S5AZO0JIAC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl2tzNcACgkQl4jFM1s/
ye+ZuQ//fgwnaZghXCAjYyw0akgrJV9QoXWIwpcFg3jaD8MlWr3W6ykUn8iN2rZh
dyolY1S7hFMI7asXpyW4DyI30AQ81fdEbivD3XeBYGWkWxm9/gmeSjyHyg5D3Qhm
5HtJnaBL+7ejSyi8bDp8cc01ayYfbI6RlBdTxl0tqN50yRiPkgoDaf37d6GDt6Nk
RfrD7W9UuXXDcHBXyimVK2QOx5Z1MPoCHXSa60tW1Mnv91ygut7C+b+lfKdwCHOC
Edf4atI1gBAzog6/miUMmpqmqZr3d0bPJNx/wyOHqF0ERq76b2LYu1HIPj0Fpm1M
ZxpcgqOmrwoWSYggbWOF9KLe1zldRWShJnUObAn9Nz0iSLu3byvexhLhz+/d8qVu
ojbOFDeIXhl1PosjEVwyRlmmaJPRW7Lq7eodTFZTMUd9wKvt5Ih+6MCmXAVMFYeD
9Wb1rkzzAt0JZR489SaXFpdXtYtlkYnkuTb712j0o7LzYqIkk0Bz9EiInJJLPcPH
AgCwQMVG7BWi/d2HDBmHXb97vsuZeJcOjfYpe442Fl8zaT47vUHc28UHjseor8hy
ZkBEUIQFlWlBGObgdowziC5tBrUjks3Ez8Oo43rqxKDACs2SJuWvfJPlHieeWS6H
OHIMic6DjQLCZNH4bGcJpU7F5QiffqsFe/wZKiEluauiPACxl3M=
=URg8
-----END PGP SIGNATURE-----

--Sig_/uCseBc73aLEs0S5AZO0JIAC--
