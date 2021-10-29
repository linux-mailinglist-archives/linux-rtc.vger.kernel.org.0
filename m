Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217E543FB31
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Oct 2021 13:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbhJ2LJI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Oct 2021 07:09:08 -0400
Received: from mout01.posteo.de ([185.67.36.65]:56369 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231879AbhJ2LJH (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 29 Oct 2021 07:09:07 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 3D6EB240028
        for <linux-rtc@vger.kernel.org>; Fri, 29 Oct 2021 13:06:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1635505597; bh=mSvyEuJocHabfroP0pVRDjH0FhYqP3ziqRP7lCnGg5U=;
        h=Date:From:To:Cc:Subject:From;
        b=JToKr084iJytrPCdUYuFkSLGqK2Bqkm14Bhw6p8cav+w+XUhUvmwooSaKQ2SdAhf0
         ZvBm7DTd3IPQQL/+3+h/ifDBAuDgxTrbGoMnD0JOPHcQXu8RICGzS6MAJEpUceKxDL
         B4fwoFVeQjigDxBFXzRaj39W5o6m0SWryDtaYyoAjX3/BtmFS053Oja/3CzS9tj2FE
         hNqbde/RNtu9CIxhci0IWcADJqTW0D72OPFNWQn+GKeNpiikfp8fJfusbmJCZfw1Xp
         CQMUOo6GvuOLr9sLD9NE5v6J9yeupY7Xpg8I+ChKDhN9CUpyCxRQsUiHY8Qh5XPt5X
         qECJDMUqxVHPQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Hgfkf6bHZz6tmJ;
        Fri, 29 Oct 2021 13:06:34 +0200 (CEST)
Date:   Fri, 29 Oct 2021 11:06:34 +0000
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
        Ash Logan <ash@heyquark.com>, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: nintendo: Add a RTC driver for the GameCube, Wii
 and Wii U
Message-ID: <YXvVuoaxGogAnyej@latitude>
References: <20211014220524.9988-1-linkmauve@linkmauve.fr>
 <YXmCQnJTujtak+Qy@piout.net>
 <YXsIwGmgy+ZIyvWI@latitude>
 <20211028213413.7lpd62vzs46ru7ul@luna>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZOQvc6zkganfB056"
Content-Disposition: inline
In-Reply-To: <20211028213413.7lpd62vzs46ru7ul@luna>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--ZOQvc6zkganfB056
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2021 at 11:34:13PM +0200, Emmanuel Gil Peyrot wrote:
> On Thu, Oct 28, 2021 at 08:32:00PM +0000, Jonathan Neusch=C3=A4fer wrote:
[...]
> The gc-linux project had such a bus driver, and I think also an
> USB=C2=A0Gecko driver, but from what I remember they got rejected in the
> kernel.  I=E2=80=99d have to do some archeology to figure out why though.

Interesting, I wasn't aware that upstreaming had been attempted at all.

> Still, maybe it would be sensible to port their 2.6.32-era driver?

Possibly, but I think it requires a good deal of cleaning up.

I have a working patchset on top of Linux 5.x, but it's not in an
upstream-ready shape:

	https://github.com/neuschaefer/linux/commits/wii

Unfortunately, I don't currently have the time/motivation to do
significant work in this area, so I probably can't help much.


> I have one such USB=C2=A0Gecko btw, so I should be able to test against i=
t.

Great!


Best regards,
Jonathan

--ZOQvc6zkganfB056
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmF71YkACgkQCDBEmo7z
X9uaMQ//eSXCvy/kTwIbqd+WuL7h2iceEUzzYw87tcQoiZ4nIC8dGs2e/myNiw4Q
fohwAE/0suHQV9aIB+N7ijYDTxmsmwMdFOUM+YQ6WvVx8WDXU2dePaOTp5SGDKEu
IjDD0+kY8R2RSPxm/vKFMSxW75HTOFyy/ctgIVbxbVzfttQJ7rMLg+uASpxf7TP+
6VbZOSXonQe1RZefeu0eUDEGy80WrUQQ0s6vQ+TrWMiwdC5MIV1tBuKy189nuvDa
1IXY79Fq4ptYCpqh6XJ+pfGIaFZDaetF9SFEmV90yxMr/p9ySUAv9hyUDGFBh6Np
J6hCDLsCHBL57Od7dZulf19gdQm2L7F32mTcIeN7e2GQmTgE8kA8GMMtJezEOuFa
ltLhTjpEViKC58hQAeRkYV96Ay36kHrXbc+fgGtAUIvHZKX57P8MHrHgpAFDyco0
mhiVs55liBhDzp+2x88SHBGrOdiIq3QRWquaWkVPToOh71HD0c16ah7NaIPuaPAn
4flEW8IzxpOvLS1d6DqJOwaY0KL+weRhnU5RM5nLD2dt9gSTAVVqN11k8BrWRnxU
0uSjYeqsSoWf8JYQGozm/cDWKjBTO0wLCdpKrqN/gHYkPdR2CM9K/xvBTVGKD+s0
yIRfV80kXYOxjPymOFM5hb8+raL4HMsfOeVWyAf11/OWlZzWWdU=
=9l8V
-----END PGP SIGNATURE-----

--ZOQvc6zkganfB056--
