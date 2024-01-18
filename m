Return-Path: <linux-rtc+bounces-553-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AD9831078
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jan 2024 01:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A9171C21E49
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jan 2024 00:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B4715AA;
	Thu, 18 Jan 2024 00:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="By9S6o7i"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8343A15A4;
	Thu, 18 Jan 2024 00:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705537618; cv=none; b=Ad71AB4h77A4SqxAL9Ei/DDS6XDaj+G8QaIsqo0NuK/5lbWReWkiHm0/HkuxFKLcT6mRu9bvnSNeWPLsJ0m+54LvZ6BOjaBNAkHqA16KzvW0xtq5KsCG5ViLxlFozk9YHT7mVA7EsET5N+wiGIM3Q4Otul+zwDPzLis0Q4XRBOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705537618; c=relaxed/simple;
	bh=Y11MMnDQODkrkUMoPffJ8wgjnX3RtCdJgA10Ir/J1qs=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-GND-Sasl; b=T4X/RIy2LUE+NVCTRr6fBQU/xmliGctRef2lYgfM+WThLxhAPjdkTBKpSCPc8BUc8FU8rqYTm9sRVPl5uIQP2QnlmEuxwuQzjCGrq4YOHoK/aLC+9d4IspC+/MRnX2CxNYiqOKjSi3xoUZ0+Iw89sTZyMoy/37Y8X+dhIClsBsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=By9S6o7i; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8CCB1BF203;
	Thu, 18 Jan 2024 00:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705537606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ElURYPYTLc+c69MHhKBF/RoY2wDRD10DnWi68LJu8Bw=;
	b=By9S6o7iB574sOOj89k06EGhLrJGakvj22L/z7Xf6TQIaPKGri6sMGKngupPbQBVYmtAbq
	A+PnCETXgUT10/ZSBcNBQEq4yKCCV7SFRyXk6bW4kyR+s+sOiDvHa6RL/MtASh+IZ7JJSv
	qcACqMSH6Ml5PyqVT7VPAXDeFYJPYhfubk3gnSmKMd/KqF9gBgtZLF1AiqeGNAFgdjVudT
	4vdf27ETJzQIpB0ZphlWke3fW5XKLvaOsCGc9TN2Yoi7QICT41v8M6iTse5rhdJT3gWJI2
	DF1kipif69tYmqj2tJ00xBR9Bij+yEomDKJEPPLAgo8HiUDVdSY8qvgQkt9jsg==
Date: Thu, 18 Jan 2024 01:26:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-rtc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Make IRQ as optional
Message-ID: <170553758513.493564.10674698195453129208.b4-ty@bootlin.com>
References: <20240105145344.204453-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105145344.204453-1-biju.das.jz@bp.renesas.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 05 Jan 2024 14:53:41 +0000, Biju Das wrote:
> On some platforms (eg: RZ/{G2UL,Five} SMARC EVK), there is no IRQ
> populated by default. Add irq optional support.
> 
> v2->v3:
>  * Dropped clearing redundant RTC_FEATURE_UPDATE_INTERRUPT bit
>  * Added Rb tag from Geert for patch#1.
> v1->v2:
>  * Make RTC patch series separate from dt patches.
>  * Propagated real errors for platform_get_irq_byname_optional().
>  * Cleared ALARM feature bit for non-irq case.
>  * Added Rb tag from Geert for patch#2 and #3
>  * Restored dev_err() for devm_request_threaded_irq() as an RTC can wake
>    up a system without an IRQ.
> 
> [...]

Applied, thanks!

[1/3] rtc: da9063: Make IRQ as optional
      https://git.kernel.org/abelloni/c/8681de6457aa
[2/3] rtc: da9063: Use device_get_match_data()
      https://git.kernel.org/abelloni/c/4b60c32e979a
[3/3] rtc: da9063: Use dev_err_probe()
      https://git.kernel.org/abelloni/c/f5334aa88345

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

