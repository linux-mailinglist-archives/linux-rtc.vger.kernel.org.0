Return-Path: <linux-rtc+bounces-4013-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E07E1A9F5C2
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 18:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 625CE7ADAD8
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 16:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30BB27935F;
	Mon, 28 Apr 2025 16:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gLaTRk9R"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2A77082D
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857579; cv=none; b=EtZYZYfYnSpE28qe/onolaYYPGLVlXs29m8G/+637yLX5kJrX8Nu2bbDmULUYYvaimYJkLgVamIT5WPvfTnFGPL3Qn1mfbB1uwbe/rApTcsJhA2ogF/En4q3Tzpk+bT/mho6rc+HpemLMFREE7YWEI32LtWFya/dd5daTporlcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857579; c=relaxed/simple;
	bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR/XAwgCdDBQBc6JegRfr+3zOijMf/EA0CnzhI/TFY8ji4WHuaMcje0ekCt+GQh3dgtjSeLzf4LauKr4b3WcJ1bZ/vJ5Mvdc6Yp0xsVRilxpm11KLJU07CcIxTsgNq3Hiu2mwINuNe2n2EGU6AxSty5RcxQihgNFYfXVjWrTTqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gLaTRk9R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso31768175e9.0
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745857575; x=1746462375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=;
        b=gLaTRk9RmlZXA87Y/qHxLw+5F6hE7EUQCv5GaE+cnzipekA9o6uZQN3Nv+5T4q+tbV
         Gpf3esXLZjRop29hgHBOaBhu8Gd2V26VRiejX7R5tSF7sesMzlLnDW7kjp8G1RJ/r30A
         KDhrP7PHBkX/AK+5w8tY91k/NzyPlZDvmNWx/fhhVbt72yNC2AW9jQW2GkpzE9NmIPkD
         BcYdMfrmCmJS34bGsTpwab8utWuoVP7P1lj92zTnbhvaMANx88dXjBEtawDuW2Y3QVeh
         2Qp9eNbMmR+CbDti+ytp3uYbF5YTr9fW4nhi65GoKA48VkKNxx5dP0q2WcoSEVqWRqKr
         3K8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857575; x=1746462375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=;
        b=VYXo19l7rcSnSheblpx71ypdF5ji2U/OSaHsjP2UTdJPEH2wnz/nxRf/kkeP/tWyvw
         SfGbMKbXdixsUksblJ/3vpcfWOZI+Lvf5GyJUDHj5TgqwgLqmq15hNc+Rjjq2X0hEl6d
         ZGhk6K7mT9fZcQ6uB9Dhs8eLiGkkviqhH+Z9rs7HqnXVmdDHI/M28f6rZJVLvIT2TIbC
         KBAx+nZIA6dsynJCso3TINIW1YiR1rlgE7M5diU/LI/eWHN99XQKsFfvkg3ynNqTXkRS
         JP3lp+w3w7YxKjzQAZu4nhxE4S8LuF+2eBVCTHhQIvurEvhG/UQhAIFo0PFbJwJF0tdR
         6vBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxOcxOUkPCuJY5vcVD3ECd+yyJrmTrf2GccIJKBcxxKVyn3tw6o0UwmPf6yB1C7F3zm5YeLTNGMXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnE2ZGFKM5NdHZ3f00gPAWMtyL06E/Tjfp1iEEMbTfYAxjDdku
	VVvoWMHBNTgFtz+/EpDX01U9QgLiDrkaD0AQNzqXrIHs+jBPDR2lLgnWtLBrX2I=
X-Gm-Gg: ASbGncvJ+JLe+cnPqFnnQrKSgqovbnJPYuTgILW3VYXHAjLgpn4brIu6pVw6DCKRZP7
	nvrMCXZY4wqFGOgNOypDs1OBZnaHjC2sGbsoFVFRN9WJhryyWtv7FAY6j+hyJo71+kjopqihn2P
	LGdQinUpU5a6f1F2T7z5Ah0g+3zdVOdysYAZEwz7FnkYdLuvBevceQg16I4pctAGzzqztJCU5k4
	s+sIL1Ok500f6JG3Psg/RtdBxRE7lAhRfbLrrLOn0mcIY+XZoSCfNrJdQwglmM46wDFhjIjzACS
	tvpeTBAzLJryOvUC2DbzbpmZ81Yl3KRj2u8kbr01u+VzhGPnLEZnep0DmrUoaD7S8HhqHbsPgXv
	uug8UL0I=
X-Google-Smtp-Source: AGHT+IEP8H3aiAFda5s5dKpOrFeQRMJEIdcZabiUZJB78eZVPzFrS+hWt+HhXg2/aWcVvb4/lTgz0g==
X-Received: by 2002:a05:600c:55c7:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-4409c4615e0mr119997455e9.6.1745857574733;
        Mon, 28 Apr 2025 09:26:14 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-440a5310a8fsm131672255e9.22.2025.04.28.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:26:14 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:26:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
Message-ID: <darxi3ojg6c6uhzyzb3224sb4lmpqcwx72pvoaam5qn5b6v5du@36zqss6i46ig>
References: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xvyefmwg7jcr7kfx"
Content-Disposition: inline
In-Reply-To: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>


--xvyefmwg7jcr7kfx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 04:29:55PM +0200, Alexandre Mergnat wrote:
> The MT6357 PMIC contains the same RTC as MT6358 which allows to add
> support for it trivially by just complementing the list of compatibles.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks a lot!

Uwe

--xvyefmwg7jcr7kfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgPrCIACgkQj4D7WH0S
/k5uzggAkQji5a5MAOBNxwmFwsge9xxOpHA0xqM5HwRUZBCYeca34VWPG6n6U0GA
bVXWEN1KWJBrgdsv/505roy1O5c3HcRRroWFLF4euSrMAl7kKfPvKbCb92TMLNwt
KO/BFcz7rRZ60I3Re6vmSTR+tW8915S5vXOV6PNh/YgvNMCnGCtIH2lCzdE8dc49
F2tW/utynBHpBiUnDE0UgFr18FyM3PQtpSCJWVpUaGwp54yVfozTDv19k4p9e4sP
XdJBBDNhi8yhT/855addjBUKSFWAW7cxCx64lq7Agwx7yZMcaaoEgdEOq75R+8Lg
SZ4wlhsxQ3BXN7P43l5g6dm94TzLZA==
=TwLE
-----END PGP SIGNATURE-----

--xvyefmwg7jcr7kfx--

