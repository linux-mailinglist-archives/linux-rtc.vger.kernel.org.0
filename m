Return-Path: <linux-rtc+bounces-6104-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNcVGjH9p2mlnAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6104-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 04 Mar 2026 10:36:49 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F41FDB4C
	for <lists+linux-rtc@lfdr.de>; Wed, 04 Mar 2026 10:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB432304522E
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Mar 2026 09:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307FF38737B;
	Wed,  4 Mar 2026 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UuqmGmN5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D676A282F3A
	for <linux-rtc@vger.kernel.org>; Wed,  4 Mar 2026 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616864; cv=pass; b=XMyNB9hmqCCuQd83vkuj9sZsATSvFISSUU1Pe9KWACeSKJmApixqu/LicwOGEjuzsbxlQF6E8duIwQZrga26vzBkQq+4qO7xMpUBoalhzbjr13ZLhF+jAF9ZmkSTpFJiKrs9q47LJssNNUY77+MWH5Zt1pIzqzR65STGKSKTIDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616864; c=relaxed/simple;
	bh=y/IodG72ain56etKDWqgOhWo0kDWmLIz80nuiwZ60Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=br1jpLkkSTBsUHigjozl68sYE3PB4k09rtBcCqdO4HxpcZOgW2+dJErZv66nxz7pDVI5QL50Rtgow17+NCr69lUwCl42KkM+g+BGYGpZF/2mZWECjEY6Fp9SC9bOhoHP5R1UCsL7/OiJQNUPOS5Bn7Xwgwm6KhpIF4nja1MYEwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UuqmGmN5; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-415b23dd6e5so678841fac.3
        for <linux-rtc@vger.kernel.org>; Wed, 04 Mar 2026 01:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772616862; cv=none;
        d=google.com; s=arc-20240605;
        b=cv0RzETDIKPGvi3+QxyNXMpkgN5JXaP8+q+Lm6I/udR+Qglzrutmuozn8jNWLk2m2D
         VewiUefVRnOSEhnIN0ycvc2dlFXr5mrqGi62wSHhUX7hjJ/8j+flMK6vUlSvyUIZGxbG
         b2uIJcjKN2fdfcza8DVgk/NQjl66/7cfr4ZUdsZjOhgVtEOIjMvX5dnCyTlhMoiUS/02
         nl6G4hC38Mj3x4X96+X1JMs9XdLgMu0pqaPeq5aaSQW9sxpr3yKy36Mr3DQpI305mixg
         F6BoMvCBrbFWj0asygEs7YAFNGw89tbFUaA403ROZx24RO3wn3Rckn2CfuANfjMyiQya
         3gyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7hb6fY86/FrgvHUqwzAV8MUgbDVO/vkX1bjsm+eW84g=;
        fh=R2c0PCtQTbs2X6mc2vwxbT+p0a4OqS9eaZz25pRXM5U=;
        b=Hps9QZf7hBmUqFJxby7Hla1LshtX+gB2hkFUFzhnp0CodrJnpWqdEqQN0fQtb/Yph9
         atpSZNZhrArVMKOQ2id63oFlmTV0O5CjEUtEnFkMf8WxBDjZW0k1sik786bbOtxiyJ6k
         xW34mGccOdxwSra79WGdVzG+zgPG3DPyJY6d/ZtmyGVmVrDhEq1uetfq3aXxfsJn4clq
         Ir8yVrZPyRAgda2eaH3xMzyuDbhapWP5P0UihlgkIQEzqWwmegpuKJzOSU2HVYHX7vs1
         ClcWTqJGv8FU+4d4M172liebvnb2ewjTU+axaT7NLvWtMeH4fvbRl7S0y6OzNj+dXPK3
         ECDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772616862; x=1773221662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hb6fY86/FrgvHUqwzAV8MUgbDVO/vkX1bjsm+eW84g=;
        b=UuqmGmN519Um9aPROx/g8S+jeBN1tF314VUZy9ssa3PfdszifQDtJhjAJ2y8np6S6G
         Fd0QWpDbIfDPrGPE/pyl7cIIqe+DJaDMvJYHWZtjmWvvcRHe6cNNeG1JkaCA8LiB+AuO
         n3NNWNthW2QlwzCpsX99pm+HtA23ayfPuvojIySqM+ccXK1IFHDxDPeKPkmyu+I9wnWL
         VySncUA8bV6E9S/PyqzH/Is7MMIum3ztli15jPs6XI49gzsI+NVuOhAasFHgz8bf+nlW
         XHFoqQnxM4xmOEvCrk69MC0t5m87o8YeMMdrr7zJcovhQ1f9XpisXQRGxYEIR594lt+R
         Q11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616862; x=1773221662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7hb6fY86/FrgvHUqwzAV8MUgbDVO/vkX1bjsm+eW84g=;
        b=NfmIcdn/p+VCyAa6zhvSWtAy+8zpcSG9DrHPKWg3KwBNmu0ACCIuKRs7eKtR5OA9Iq
         3q3kQb17O3prT6C3l+LGjVDMx2FCseVwzjbBnWecK102r9wB2/UnjhhZIXFyIjGgORCc
         ikyWPdeWk1WIVN0UQ7vlun/bP6nZXK+cI3LH5Cmq33Uq3ulx0k7SrK506/lJL7kgY/p2
         Y8dCRsbwZQB3ycSv6o7UtvA8hPeBMwid+m4ixZo1lQKAI9wnYWWAhBQsOYzfyMnA6R8Z
         AtRgPHHfOGqooMMS+rGJ6qjinlcbXcw2YxHaeQKs9PlBHJj1f+GaYZ1b+Fr7AEoLsJrZ
         5MMg==
X-Forwarded-Encrypted: i=1; AJvYcCV1DuL1veZ2Osqb5DcTZAofrcKKlLjiBv4H9YtJVuJXegsLxyqWg7QQLtu+VgjcLjsYz2Bm8JAiRug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw17c5y5rBnk9iKJkVNrNpXTR655ayHI8q4dNyI/ymnM/M6ZEej
	hHnYnR1Dwe+kpv0TNkG302e4AvpQr9pSceWMNcTtYBcyPVfwn1nZ2feen8GuZdF/qpXEUW2f41i
	Z4NvZlmF3DsJ/C1vQixdaW2xFGbzRIVwVA3P+1AJjOA==
X-Gm-Gg: ATEYQzzmqvVw79CofhFcGNaQML2cECoTfYO5RHBALyWideRtllrPFi8H9FFlTmBFQ3O
	uPu+z219WslXCT6hfaK8TSh2ogrW9IMeGlYEINvia403U4r+RJNKuf35bDcyB31ty8Hdfd/ZFq2
	nlIX2YK7zRIaUuE6SL4D7hXjlPIXYYgPjXLrYAr5AtleynmOn9wLblZjAl4/3H7lp1uk2+awSlN
	AXwUFNZFDQXpZCmIckoyXO3uxoiLGw9ZO9nHhFLMpx+AkPsrA/2Hz7ZlSH0UJbWamjJjpAhzhrG
	X+htHHy9Kn4IIlXC4nZP+hi1345WQjpbHyXqudbJXa+kQ0eG
X-Received: by 2002:a05:6871:112:b0:3e8:8e56:671e with SMTP id
 586e51a60fabf-416abc3c442mr740209fac.54.1772616861704; Wed, 04 Mar 2026
 01:34:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-optee-simplify-context-match-v1-0-d4104e526cb6@linaro.org>
 <20260126-optee-simplify-context-match-v1-1-d4104e526cb6@linaro.org> <aYrAeEiqG7iwXm_w@sumit-xelite>
In-Reply-To: <aYrAeEiqG7iwXm_w@sumit-xelite>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 4 Mar 2026 10:34:10 +0100
X-Gm-Features: AaiRm52FcW-OAyIi-wAaObIfx0MwPHh0zbRqzlqQxviphSbb0F7X9gKg8pS94SE
Message-ID: <CAHUa44G1+C47KY8UCV5+ype-NCjYPfgxFs_tivmsOA=R-H1C8g@mail.gmail.com>
Subject: Re: [PATCH 1/3] optee: simplify OP-TEE context match
To: Sumit Garg <sumit.garg@kernel.org>
Cc: rouven.czerwinski@linaro.org, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DA5F41FDB4C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6104-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 6:22=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Mon, Jan 26, 2026 at 11:11:24AM +0100, Rouven Czerwinski via B4 Relay =
wrote:
> > From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
> >
> > Simplify the TEE implementor ID match by returning the boolean
> > expression directly instead of going through an if/else.
> >
> > Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
> > ---
> >  drivers/tee/optee/device.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

I'm picking up this.

Thanks,
Jens

>
> -Sumit
>
> > diff --git a/drivers/tee/optee/device.c b/drivers/tee/optee/device.c
> > index 950b4661d5df..4c85b04d6004 100644
> > --- a/drivers/tee/optee/device.c
> > +++ b/drivers/tee/optee/device.c
> > @@ -13,10 +13,7 @@
> >
> >  static int optee_ctx_match(struct tee_ioctl_version_data *ver, const v=
oid *data)
> >  {
> > -     if (ver->impl_id =3D=3D TEE_IMPL_ID_OPTEE)
> > -             return 1;
> > -     else
> > -             return 0;
> > +     return (ver->impl_id =3D=3D TEE_IMPL_ID_OPTEE);
> >  }
> >
> >  static int get_devices(struct tee_context *ctx, u32 session,
> >
> > --
> > 2.52.0
> >
> >
> >

