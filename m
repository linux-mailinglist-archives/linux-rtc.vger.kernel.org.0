Return-Path: <linux-rtc+bounces-3543-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E45EA66454
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Mar 2025 01:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6426018980DB
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Mar 2025 00:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F19B80BEC;
	Tue, 18 Mar 2025 00:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="jc8BN7Rd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8182040849;
	Tue, 18 Mar 2025 00:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742259515; cv=none; b=dJukKaE7fDAlw1WSvs5nQIrP7M2nw2UXwxn7VCunYQBB3T9eMRp18Mu1/LyjzCiZOdVPgDfe+JCHuyPvlEJgvJewBJ/AJtHWZebs4aav6IjUKQ1RHaiFBbc6JtNnFRX67IMTnyoi5MA0Pv74Hl9ayt+3dlnM0E9w1vrE4h9qtwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742259515; c=relaxed/simple;
	bh=8nsBNvnH54hqAh3jvOcKxLcm0lF5Rm/1ukltzQEWli8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dyXCbYOdgoncf5cVEaTirB7/3H0A9bdEWdNjTrPGOjoL1D4CZi9AJerFOUVVYkU+4Ps5gNHPcQapmB2Ew1G2ZKnEyVOK9xQiO6GcbBEkQa6MMmbbbekiBcSMz6wZ0FohLvyc2mMjZdaopUbaurNQ+C6QGPOaLuQiNm/ykIkvuus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=jc8BN7Rd; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742259511;
	bh=8nsBNvnH54hqAh3jvOcKxLcm0lF5Rm/1ukltzQEWli8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jc8BN7Rd17gp2gtEEmn7TWB7s4bL/KU9WzIoZXxwN0EXE71k/IBhjJ+q389jhLkFh
	 IdxPT9Z6TJhLCxxAIGaPi/VyQKog/r3YqcPEFnPtF+U6OeS4BHFLDsU1cQgkR8l9fC
	 jaD1J2NKmGr8roMHDZPf6TDA3s9WwqZTw30pOurMTzahUISzqlD+tF4+7MNqrWElPk
	 IQjOSwm2zi669uXJEub8r3Cz9A+EPj/LvtmNuaNPKOJ/XPO6H3Li0oKxcKVnKTSEN4
	 +hR0JWntitto6WeNRxUqnDmKb4vmL0CunRRtl+XT776blnwKyTi9dENlyucXHxDtN9
	 LK1os6FdOJemg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AF2C277BB4;
	Tue, 18 Mar 2025 08:58:28 +0800 (AWST)
Message-ID: <3e6a356cf1e6f293a2218e1c006f0222c9e01fa6.camel@codeconstruct.com.au>
Subject: Re: [PATCH 03/18] rtc: aspeed: drop needless struct
 aspeed_rtc::rtc_dev member
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Chanwoo
 Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley
 <joel@jms.id.au>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus
 Walleij <linus.walleij@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  =?ISO-8859-1?Q?T=F3th_J=E1nos?=
 <gomba007@gmail.com>, Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org
Date: Tue, 18 Mar 2025 11:28:28 +1030
In-Reply-To: <20250228-rtc-cleanups-v1-3-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
	 <20250228-rtc-cleanups-v1-3-b44cec078481@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-02-28 at 14:07 +0000, Andr=C3=A9 Draszik wrote:
> The memory pointed to by the ::rtc_dev member is managed via devres,
> and no code in this driver uses it past _probe().
>=20
> We can drop it from the structure and just use a local temporary
> variable, reducing runtime memory consumption by a few bytes.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

