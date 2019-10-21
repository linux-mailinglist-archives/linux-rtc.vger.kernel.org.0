Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2A9DF0D8
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 17:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbfJUPGy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 11:06:54 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:33142 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727344AbfJUPGx (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Oct 2019 11:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WETdFYYrq4w2EWIdmuT9/HH33IhUB1oZZ8eaxEmKNFY=; b=JlCce1ySDXFn3igTid9FXB/eS
        EuLucj3329ykLwomeob79Dpzj91qV/1pgOPABO5Nj/2TAILRhpqSzmfBhlIhP8OLBc4B+znkWxD5S
        YVZtPdZyuDg3FU6HZrJFbkUgGva8/pp1M5TVs01vtl9JhHrknZn4MFhHS5AZ3ATZsxXG0=;
Received: from ip-109-41-64-49.web.vodafone.de ([109.41.64.49] helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMZGg-0000mk-8i; Mon, 21 Oct 2019 17:06:50 +0200
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMZGW-00010D-LO; Mon, 21 Oct 2019 17:06:36 +0200
Date:   Mon, 21 Oct 2019 17:06:20 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     lee.jones@linaro.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        phh@phh.me, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH 2/5] mfd: rn5t618: add irq support
Message-ID: <20191021170620.7a2b594b@kemnade.info>
In-Reply-To: <20191021090710.GT3125@piout.net>
References: <20191021054104.26155-1-andreas@kemnade.info>
        <20191021054104.26155-3-andreas@kemnade.info>
        <20191021090710.GT3125@piout.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YRaonVMN0kbDymw3IkU_qG+"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/YRaonVMN0kbDymw3IkU_qG+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Oct 2019 11:07:10 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> Hi,
>=20
> On 21/10/2019 07:41:01+0200, Andreas Kemnade wrote:
> > +#if 0
> > +/*
> > + * REVISIT when implementing charger:
> > + * according to some other implementation it needs special treatment,
> > + * inverted but experiments seem not to confirm that.
> > + */
> > +	[RN5T618_IRQ_CHG] =3D {
> > +		.reg_offset =3D 0,
> > +		.mask =3D (1 << 6),
> > +	}
> > +#endif =20
>=20
> Please avoid submitting dead code.
>=20
ok, I can do some more testing here and add that thing properly.

Regards,
Andreas

--Sig_/YRaonVMN0kbDymw3IkU_qG+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl2tyW0ACgkQl4jFM1s/
ye+l5Q/+PTqeFB0Jvhwc/dTNl37P1/O1cmppFbxi4jphvnDG8WTAuhg5zdhflsVA
JDERfMla2M3HyJmjbT3boDRoXo0aoSSOnwnlkNAg8PDCzpb8CdRXGBwuv7s6FCp0
uQn4hOulgCZXPxNmkp0A6e9/q+HIiR2YcfP9tVAzcaschIfS/tuZb3XGXcE4wz3k
KPdMMPEtr2rBnub9o5wrE0TUU0yxsyK5qoAqQowlyL/e1HeafLPHSih7AEhNDMNM
NO1aChc+Vql5rWJtO/seTSq/NP6BvYGcX3TrnucTIC9YaksPTDe+DhsOnV1mYCW6
YBRsatl7o026kly9+9v/cT5pg03UCb5gaU2Nc9GG7qBxJxhSnxIPbZ9r/4UOF6WD
e3AiNP7WiqiQ6Ahlsd9rBCH3LErgjPR4ecco7H+u/ric3ypozWH+zjrrnWW+VYVo
L6PTT8zxOQw9p2pBDGBu4Z5GBCSI/esmdwHW2HzjKxPgJlc5cvwx/2hgs+XbpnhR
SfVBiQGGYXyFmwy0zeycKlM/ZdiDPcGP2ljb4nQISd4FdNonCmVfOOmRmW2880UY
kw8BB2MzzVEF5VJ2Z0XnBS2kEAlSg6nzBPpnvVcm1Iq/MVIZX/UVDJUZiun0MJBI
kghNQrHB0wgSHJplxqXsa0EX5/k+rtOgNoAET8iC07XhZ1bzK20=
=QgyE
-----END PGP SIGNATURE-----

--Sig_/YRaonVMN0kbDymw3IkU_qG+--
