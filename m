Return-Path: <linux-rtc+bounces-2514-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC089C485E
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 22:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A33B2B3A577
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 21:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CCA1C3F34;
	Mon, 11 Nov 2024 21:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MAVkRchX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAB31BD000;
	Mon, 11 Nov 2024 21:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731359092; cv=none; b=bvXgQBR51m/C8SVkdfMkuXFs2XYNnMxA8RYNlOnCf9xIF/JI5GX8bRC2xvoDnrphGrttMFVqHVbGU8ebFeI0kKfmOonph5tMyP5u5C4zIzzprJKNrkqusjksF4ArAMuLvReITLSmHh5gFclKiaWgLvbh2JeUYisFu6vJi5brNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731359092; c=relaxed/simple;
	bh=iB24JtsBeFLIFaXulkr/dFKm+SEgcBjFNMAFM0/AtNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkHkfGywvexLBskHZC5jhR9Ro/k3z0NONAuzPZ3fvoxzfSr+MYJ+ZE6YVfMWG02FsFxmVvsQ9k7Nk+hUiG3O4mDH637UkYuOGMkFAByeDWFCyx1vxJsFe0K4gvXsMY39lst7WDpyUGJUImFpoLJZDicgrwtb2wqn+/BKz4nJePg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MAVkRchX; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DBEDFF807;
	Mon, 11 Nov 2024 21:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731359088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LObrxn3R4XtlprnERAFFhmw2ApkNAoiNEB3fkoJZITE=;
	b=MAVkRchXggZBxDxPHd6AZX2qiAifA7ijtIEZo1438VSGrVZamdo414JKLILgKBS/E/GudL
	K7eJdXQd1BSX/kXpLhu1oVKxXHBbkvOgEoz/kbVdeotMDe4m8cF5zmI6vGXN0p6bgGZJLq
	bd4f8CJKP9ALVDp7JfHogGIhiVdXK7sTK58s0XJMRqgUnRkAcxaGzoLe3EF4rj8dCSmHu3
	JF/WmZq+GxWgyj08XEoGRTnZHBaGYeZmv4qvAkYslCF4qKufG5VBQC6HFSUhFjf4t3cylk
	xRsBYTHFsNO17OAdY17sdmGz6dpSn66m3NsZTyNJV9/BR6Lmzr/pBPLTm5jHyQ==
Date: Mon, 11 Nov 2024 22:04:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: lee@kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, eddie.huang@mediatek.com,
	sean.wang@mediatek.com, sen.chu@mediatek.com,
	macpaul.lin@mediatek.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: Re: (subset) [PATCH v1 0/3] rtc: mt6359: Cleanup and support
 start-year property
Message-ID: <173135898216.3303301.4242491728556386052.b4-ty@bootlin.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 23 Sep 2024 12:00:07 +0200, AngeloGioacchino Del Regno wrote:
> This series adds support for the start-year property and removes the
> custom handling of the RTC_MIN_YEAR_OFFSET (which is, effectively, doing
> the exact same).
> 
> The start_secs timestamp was set to match the previous one from the
> custom behavior so that there is no time drift on any device after
> applying this.
> 
> [...]

Applied, thanks!

[2/3] rtc: mt6359: Add RTC hardware range and add support for start-year
      https://git.kernel.org/abelloni/c/34bbdc12d04e
[3/3] rtc: mt6359: Use RTC_TC_DOW hardware register for wday
      https://git.kernel.org/abelloni/c/d6f471a74790

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

