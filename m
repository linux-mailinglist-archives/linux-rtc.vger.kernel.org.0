Return-Path: <linux-rtc+bounces-4020-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A93AA4EFA
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Apr 2025 16:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68538178168
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Apr 2025 14:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677EE2AE8B;
	Wed, 30 Apr 2025 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OF0GYw09"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA50224FA;
	Wed, 30 Apr 2025 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746024460; cv=none; b=qo4MBzzdSTyMsUVltzydvqmAGpFv9+bF5gA2cEuTIXj0C5Y3VH8XtmYAqfUOPLiFGsOPKTGIHQuZr+WAYbqXmw0PWbjM82rdrKYOTNsv+olut1XiFMWgrfwb55DN0WlY6o3H3VUy8K8yyvrGcDsK5Eh4jesgY8ULpFxeRmsFFvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746024460; c=relaxed/simple;
	bh=8Kby3BF9Goa+u8k9qxOdZq2WO9DIL0NJjF87tLz5zeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hw04bmd/m4CBSUQZgdrsqRV+Zbq6pQOGoeCuJW/CMb1q90kq1ZgUwrUz0zjjEVbmz7Ry+SrSIvlGazZVyg8fX+kXzHTks9qCkxaK7W8AIk1goq7uqLnFGhQGLQ+X7YCHebIsctPSj3MMGL5sAki6dx7be8/unJICpJHp8tuAva0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OF0GYw09; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746024450;
	bh=8Kby3BF9Goa+u8k9qxOdZq2WO9DIL0NJjF87tLz5zeo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OF0GYw09mwXW+/AF6xC9bMUzN2ywdOOiQkfxRpk7R8/ttoZhe3IGNKpbP0I4dPMGt
	 ndet0ENHqF4TXoS+vskRGolwyrnEE+FwiwJx1MG2HCdM0wEDZ74Fr8EYp5ejNvviYk
	 Xj+sG6RljlA51qNyywAS8EUJPbhESbF3mpiXL9136kVvjTY3hwgIqyTIVrq18Zscpm
	 xtscdC88iGoNgOSGWgZhOETvcXNajHCCkawE6LQeo/+yj8ATAKNdz7yb6GxlLGT/ZT
	 SMbcr0h651ImCTq9VS1kxyyA0MT3NsdUzgao/YHqRYHPHsMy5Lf0pkdH+Koh/N7Rg9
	 8TSyXPhob+cfQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F7E617E0630;
	Wed, 30 Apr 2025 16:47:29 +0200 (CEST)
Message-ID: <5a99252b-d251-4385-bf53-105262b821a4@collabora.com>
Date: Wed, 30 Apr 2025 16:47:28 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 28/04/25 16:29, Alexandre Mergnat ha scritto:
> The MT6357 PMIC contains the same RTC as MT6358 which allows to add
> support for it trivially by just complementing the list of compatibles.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


