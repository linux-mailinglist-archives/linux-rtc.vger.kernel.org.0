Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19B6D10725D
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2019 13:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbfKVMqW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Nov 2019 07:46:22 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39678 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfKVMqW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Nov 2019 07:46:22 -0500
Received: by mail-wr1-f65.google.com with SMTP id y11so5362250wrt.6;
        Fri, 22 Nov 2019 04:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bDXNK5v9qKr7OQwTjxq99LXUWs6eeVepuS3dcsLFtW4=;
        b=KQRc7C3C3W4oWTdKKQFt1duNp43vDWUBDrRy7K4xUZzxwE5/3K3pQV1f7S5lOS4QN5
         LVUMD2p4rkzT2VaJ4eD0Whbg54UIeDGEmgrLtzzjuD4uRRh6ohbYwXcQ2fsDQ2jxy068
         dIzGjNN2eBWyWmc2BRE599Pq8TuJ/wW6lX8IL6tDRFEeGi23bx+QHI+xLQRvNs05rH9n
         c2Q+TuA5/l3kQHkRRAy9NYfQTzBi7gZtoBJu1LRTqHvLIjLzACB8orjGOmE6XpTEX2mK
         kxL1Q+XQdHUGQEtZfz4s8mJqcImvL77qqOAGGkFWpf1dndmo5XaQWWLrr8w2pjoEUwJR
         Qttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bDXNK5v9qKr7OQwTjxq99LXUWs6eeVepuS3dcsLFtW4=;
        b=sfZ2G0sDCulXJ13rvDdD9QgrTiTvf6flhjDuTLYUwsSYdv6p/IE164OIGGd01QYXcP
         Gfq/X+EAaZxjEJxa5V6dEyfcHRrHZi7SP8ybawXZapDkueBCk8YyYA2CWUb1sAxYgnu7
         pIE/Uew8VeIkMvOKlltRE9tvHrRVMEJuGTcwnmRcX3MtNEC1MEZMun3ECuoiN+eRqbqk
         gNj48L4XlaFy4hhgUDMGW94i5tyYV3oVTWfHv063mAOnqQJ1p1nyzs9fq1iHYGJSemRi
         X3jefQtJSOaiu0VT44fw4T8VIo8bUhkCH1Q3VxDzSXfHQ/G8411LYT19cp3cdlTyQq0I
         EeYQ==
X-Gm-Message-State: APjAAAVSTU5m3HLvnJKtBZ1BdVKpqoizvd2TVkOy3YKIgd/9Q5qDFXwq
        Fu05Yeh/J7q6kVnYbtrYiv8=
X-Google-Smtp-Source: APXvYqyGWX+rpJz20h7BkrtsSPSMbI2yhMEZ//p5Lx12ldQjaqQpRtHl1+9DJBO/Gk3XUoWVhM5xYQ==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr17605096wrv.104.1574426779895;
        Fri, 22 Nov 2019 04:46:19 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id t16sm2669042wmt.38.2019.11.22.04.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 04:46:18 -0800 (PST)
Date:   Fri, 22 Nov 2019 13:46:17 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 7/8] rtc: tegra: remove set but unused variable
Message-ID: <20191122124617.GA1315704@ulmo>
References: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
 <20191122102212.400158-8-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <20191122102212.400158-8-alexandre.belloni@bootlin.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2019 at 11:22:11AM +0100, Alexandre Belloni wrote:
> Fix the following warning:
> drivers/rtc/rtc-tegra.c: In function =E2=80=98tegra_rtc_read_time=E2=80=
=99:
> drivers/rtc/rtc-tegra.c:106:11: warning: variable =E2=80=98msec=E2=80=99 =
set but not used [-Wunused-but-set-variable]
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3X2I8ACgkQ3SOs138+
s6FlCw//ce/vcaSSR1eDEaIkl+t8qLZ/7jPZ2XG4Qurs6y0mO7DOM8rIYY8JYT3p
r6xx3tL59DWK4q5JM/As+n/aCnltdeP7/N4zYAX4OqBnmCuXFVwMJKVI+6dKYMuS
CEeb7U/gjWGy+cT8sgRTDYu9JdHaBrLVthJ+egI9HCZwXsssuWbsCPtqgotJwrgY
a3gnytR4C44HSxpl80j94rH6kMbbOxoJ88Wt3b1BxVbpixMISeXdDWvbPjQOsyWG
LyYex1CLjoh/xIXKArNQ3kcyGUtMWvVaUzFwZNYS7NSTSKeEtJLjTQz2s+iHueIv
VR4OPuQ5MM8JHJea1gCCBeuzamu5HjI8lCV4L+rcZre3pGKhYiXy22UwQUCRb54W
sfi7HSvA32cfeCAOJW3BeuAznILWOnRtypqQqb4pNA1e+I8J3P/WllLNYI4sImXi
etjgaGB1Qi15GR/Do/CjN03GS0wq/qgXbmyjnln4sOHsVEtRnm7jv9lcedkvlKeq
Ps26vJC6NV9dw5OVV8Zr6uI3fk7VjThsnvAyqwY+FpurbQrbanQKWrA8mZpzYDV2
Ytbv5ftlO0dRlGlhOgH2YWUpVYBAOifOHlKvRl5PatA6MaFhTYCithXJd33P++TY
ev8YnqXS41FTDoDUG0uuk5g2m0+AtiCN8lGKspYOO9YVdhm/4x8=
=Lkzk
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
