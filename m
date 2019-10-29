Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 135ACE87CC
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Oct 2019 13:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730377AbfJ2MMb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Oct 2019 08:12:31 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:53398 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730269AbfJ2MMa (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 29 Oct 2019 08:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Eiamd8BZfLfRuXNZB2AmOrEcDfBpZ/Uhno+/TVo4R04=; b=BkgtdoluLOQ/wU6W7bXTn08LW
        /CDuKs2U9LxRap16ydtYGsiNXTM8KbS90p4L6IK0pCK43+VyuxVM6vfrB3VPq6+MrVpVx8WCnItMp
        EfjmhjJ9/MjaDb6GpE3b+e8em1ltjaLqKgXZVH7B7eA7xn5VzDAsOc3W9PNOAz7PLQS+8=;
Received: from [2a02:790:ff:919:7ee9:d3ff:fe1f:a246] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iPQMJ-00070z-HR; Tue, 29 Oct 2019 13:12:26 +0100
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iPLGh-00077y-7E; Tue, 29 Oct 2019 07:46:15 +0100
Date:   Tue, 29 Oct 2019 07:46:03 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     lee.jones@linaro.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        phh@phh.me, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH 5/5] rtc: rtc-rc5t583: add ricoh rc5t619 RTC driver
Message-ID: <20191029074603.499a3940@kemnade.info>
In-Reply-To: <20191023231717.GU3125@piout.net>
References: <20191021054104.26155-1-andreas@kemnade.info>
        <20191021054104.26155-6-andreas@kemnade.info>
        <20191021101528.GU3125@piout.net>
        <20191021231359.1cada218@kemnade.info>
        <20191023231717.GU3125@piout.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/t.bt3Q4nWziP.Q+C7kPJ5iY"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/t.bt3Q4nWziP.Q+C7kPJ5iY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Oct 2019 01:17:17 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

[...]
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
It rolls over correcly, but rtc_valid_tm() bails out if
year < 70.

I am preparing a v2 of this series.

Regards,
Andreas

--Sig_/t.bt3Q4nWziP.Q+C7kPJ5iY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl234CwACgkQl4jFM1s/
ye9YORAAlarwaf3wXAvD0muX8zYJ4SLGZ+jOO9JLBcR8mAWjevZg/fsK0juGopPO
FJrDvCIYOQ42i92/nNuALcQz4uGbsUqnYQB9KvxDwGeYIMRijjPciNeYgBwegPrk
QpwhWFXKQQrcgvGb/KvZMxmHnoFmOMDY4qa+ZmxhzCtRr0FKC57lGa+isTcihxm7
0LAb35kb2Vqx+O4LZsS5agDiToJT6oW3bDG7MwjTkgul1Z+8mMitr43zIlVM6OcI
ASt8rNddP++fOsexd3ossl9EH+/cpOe2m6S/Qgm2vwTxpEr9lmeQ4KYKpb6b8FqP
ZfOznrGGNZgzOGjx/3EIUBFXvTrISmcmdQymj0Y0P0omqc+qeGnCt5K6LDdcBcQU
83XcaAPAhIkz2cHmQ6FRTpIRoM5O+bjt1fduQF458vfasNicCE1jPUozYJsVgCzh
aetmPqSviPt3ha2d9hq1A96+L+zFel0F60KqwI1jrnxpu4Q59Q7d5uGBcHBnnqk8
BT7EZe6DCnHRPVDGPipjqHdefeQu+2FXcrQPbLxfuNewDowj5KDCRQyFVAgNjvFy
sFL/anHT15WFB3tt425cChaTC2V2U3QfguUuOFhYJ7EUqLA5TAKWwcTUV7WqlUap
udFGCx9RREvi9WkCTXpD06y4Geg/MAaUvrNZxKcYFRqVGGHmMEw=
=XPEe
-----END PGP SIGNATURE-----

--Sig_/t.bt3Q4nWziP.Q+C7kPJ5iY--
