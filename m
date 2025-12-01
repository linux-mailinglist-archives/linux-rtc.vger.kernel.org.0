Return-Path: <linux-rtc+bounces-5502-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F21C97C87
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Dec 2025 15:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E99E3A15A0
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Dec 2025 14:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2206231770E;
	Mon,  1 Dec 2025 14:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbwrnzZE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6401A30F95C
	for <linux-rtc@vger.kernel.org>; Mon,  1 Dec 2025 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764598319; cv=none; b=KjEVJOyDePUtAhiF1NKs1xnmZ8V8cFXaYuDxXCAz74FfplTcHp9whdViv6Dcwdyd5PWK4utrQxKgcsKdrtmQJ61k5znb2NAl5keQFYBpWrA/uJqH5GKkE9IjGCN3meXIvlaGSuKtGkFWbJyIZoiZ6B8KdFDXleFtkm10QnHJb5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764598319; c=relaxed/simple;
	bh=BVJmf3Xuu3fw/WPzSDZ8T/wbnfKxhSBCsKNf/k4giqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTawcPgDyelIiiBeoS4e49k0hcVmG7bxXswI2Y0F0tketcNVz1Hngil25JRrgwBrFoaq1mFMfPaartuvupfyAM+Tq5wJX2dkaGrWe3ipl3QZ09KPyMh3qsLplU0jc0jmGEOd752JwyUov7t51Yd/nf3ahusNCjle8QuO1Fi4/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbwrnzZE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e2e2eccd2so1036896f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 01 Dec 2025 06:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764598316; x=1765203116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lHAOpqQKKIfRCCbc3jkSqq0l7D4yj6gzTY5ZBvFB9Vk=;
        b=VbwrnzZEX16pcL/NqTF+tLJeNEjJiRFM+X06CXHk8a8FcQmqxEMNAyo6jMLHhpR7Ei
         glmvwlTrq3vJL8rljo4yNpWWcyL7JXqwzN+fthXFaBDpWsVaTA6khpf68ft/U4gAmEBn
         JhQ87ozczr2+rZX+irQoBjBgUeRoBJKWRUuDIow4CNLe6IABqeM/+8qnLK9UVwylsBlG
         quqFS31S3JdMHcvU8Sj24klFfIogWbe3KWf484gRXItA8q+P0a3Tknx0mpr2/qBBIRvh
         fjco5KXvBBVBL4ePhf4Kuj4RfrGDZIj7DMBc/G8ZUa/mGpxsd1YbsH23nRHWcVhHq9fE
         FBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764598316; x=1765203116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHAOpqQKKIfRCCbc3jkSqq0l7D4yj6gzTY5ZBvFB9Vk=;
        b=PgoniHbhmdRTVm9eAP6w6Tn9SYOtdbgg5AXy+C5nwZnA4A5BkQUzAYD9dm//AqR2iu
         hGFOOpRxR2jWpBE7k7GCVxYuzNYZ6nqanAWWe7cG7VqVFjUZXM2L+4b2KX9Kkzb8n8uK
         9m/Mt33F8LXMGbLlco2GfqDdlZG0kZtJ7uwilGA4ri+IDbAdMTkcaCGnEPODEIIqCpvL
         la6vBhqzdr34GjLoFzyew7kt0Vnar7T62aCsLXzQs9F82/PSm62p+CEwNLdAiCInXc53
         MnJPefR8Fsxw12CpPfdUZ7flPU2Z/ipr6A5AxPk6V1AKEotb0mh6EKlv5MkTqpds2nMN
         GAog==
X-Forwarded-Encrypted: i=1; AJvYcCWEsOA50n5XLqzZrrelGrJKxsSahZGwb5EkP5kdN4zAHz0KEt1s4Cg8qwU4lbP51UzC202/E2c2ZDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVD93AYQO0P2+sGbqKCpNsh0mD6oGiuOf9IOZ8SFkOpH8o+gs8
	MdNCOD2WuRcTJpMCkOIzuFfiNTTcQsATGVf3goPQjmt6Kx+/dhkBNbMj
X-Gm-Gg: ASbGncsEuIWT3gViC3DM2UaWn1A2EqJxlWeu5g7Xh0IIpgA7H2p+Wo1yhPJjJ7qFllh
	sypXw+4cH00S/F+JQLPFxSxJzQSKhP5KYA4qOumAtHk29vSSen7GU7HrzZREpyreoCWf8tlziFC
	C+w7Ak7rqnYr8QXfS6cMeNDYgfgLNu0WGAYZ0x9VuZspgy5FAVUNK+p0rXuuSLCPP99a77xjvrV
	T5VNi9E7QtRK4kJ/Mx2jRppGfrhw/jmUSiX/wqxx6gOGcGzSI2zsh89TQmzCDX5exVvbhxQ60Lw
	K9t5D3VsXTaBfsTSqJVwDLTUcyb8zwTGylCwyUdogmx9+ezlz62EEtpYMXQtSXTLjF4BtmTjmEz
	gMT4qE/pBM4eXV+IM1ZFcBwOzNFCJO7OrliH8CRzvNIia8IsSh8YlscE2tcpLHJCUp8Htvv0yvX
	wt6X2EvFSG4ux3YGR43FBl786EsWiGDNN2g3FHfso6J4PoN9XxXSMrLd+LsdBij1Tie1XRb/LBv
	BdLArJoa1tJ
X-Google-Smtp-Source: AGHT+IHEWXHNm4jgi3iEqgIv+q3HmZbNeQU4C1w3dyTpiZ7UGgjCSsuVYY08grV8BGGXUiZK0VrsYg==
X-Received: by 2002:a05:6000:2385:b0:42b:2e65:6576 with SMTP id ffacd0b85a97d-42cc1d51b47mr36718531f8f.50.1764598315408;
        Mon, 01 Dec 2025 06:11:55 -0800 (PST)
Received: from orome (p200300e41f07e000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f07:e000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm27546394f8f.26.2025.12.01.06.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:11:54 -0800 (PST)
Date: Mon, 1 Dec 2025 15:11:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Shubhi Garg <shgarg@nvidia.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC
 DRIVER
Message-ID: <svixpfd43ntolkh7qflmlry5u6xsbffzyqcvvjx5ddnnhxoflc@wucgay3en4md>
References: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fsv5t4iejnahkav"
Content-Disposition: inline
In-Reply-To: <20251110073544.443816-1-lukas.bulwahn@redhat.com>


--2fsv5t4iejnahkav
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC
 DRIVER
MIME-Version: 1.0

On Mon, Nov 10, 2025 at 08:35:44AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>=20
> Commit 9d6d6b06933c ("rtc: nvvrs: add NVIDIA VRS RTC device driver") adds
> the section NVIDIA VRS RTC DRIVER in MAINTAINERS, which refers to the
> non-existing file include/linux/rtc/rtc-nvidia-vrs10.h
>=20
> Note, with the changes of v6 to v7 of the patch series adding the driver,
> the content of this include file was moved into the driver file, and the
> include file was dropped from that patch. It was simply missed to adjust
> the section in MAINTAINERS that was newly added with that patch.
>=20
> Drop the file entry to this non-existing file accordingly now.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--2fsv5t4iejnahkav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmktoigACgkQ3SOs138+
s6HFuA//UXHErOTCDPmmtxQcXOB6bKl7xnjaUSYWgpNbxFW9X8mim+q8QUeylFwH
ZUw9gzo42SaWY+gJWKIBUhx4DBjNLHTU4ZOBsqpVhgS3qFbkFEzExdj4eQF7khH8
ambbPnXHOvfdorpaUPKJd3mMvbB5LjX+2HgRA8itb/bS9zBR64dqBSEwtQaLTBTk
MKRSLamu7YgJ6m+wXkLiPhuCHqIXgS0pGFoNqBU8/j/TrmuTo0C7XFAZAKG0Vz8a
hn6/Uv6K8yE1QLvjCF9iLa7AiZG0XCuR2vIUMto898TpSu6QjfW480MVLOf45U3G
7Xa6Yxhsn5bibBDeTBcEMisAIZTW8+g6XFmb15bQ5DJ5vAKDfBa63sEgzLfgSxlw
Pgbvbq6g9ICbO5kNpPiXL0La0yKnYMHYaHJmQyOkx0DLJqfZOnFTN2dY97EIT7Xp
fKPZMQgGI/Y6I5MC6zAP0+0eGXfnGtAFjJIFYw00RbprnXqQpQbh5ccG7dqYs9gd
m6CvnRk5TZ9eiV1YSH89ZEAqT8Rd8sz9M/32kNt2ygX4DBEV+vAdSN1uMTLclbDz
BHm0KyxU5i9YQmZXZIwQSd292ZWsDgUFxtFrUatbuqM+y3xYbZYLCDX+K9JDFyv7
Bu7Xl+EAQzQ17mgS1lyT7m75DWUWbRYm+w8vsLja4uLSDb2zldA=
=qhJ8
-----END PGP SIGNATURE-----

--2fsv5t4iejnahkav--

