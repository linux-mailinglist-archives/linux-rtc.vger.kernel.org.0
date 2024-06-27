Return-Path: <linux-rtc+bounces-1413-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E4891B241
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 00:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC5B0B20CB4
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 22:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59841A255F;
	Thu, 27 Jun 2024 22:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hLOML0Kt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0B619B590;
	Thu, 27 Jun 2024 22:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719527701; cv=none; b=C5UTIEBcb+Q7i1GGXgMpg57dxBIE8yjGD5eqeYnqq9/o46AoOO08Ig7N8b0OCIjQRlpTTTKad2mnlc2gUxnTxKgLIR93C0fsHnkmlGV2ZqsweVvNlIBrzzRUcYeHBf8X39+PFIx6ha7cIsSxhwTi3dPikYTNixd8fOYEYbREQDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719527701; c=relaxed/simple;
	bh=K2kDsg52vVz9RUL430PcnuYfab9jZLTP0mf/Z1Zl4PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSbX1xGpfv+O3ocqX1ZoKOY9jorOeqIex0LGYBu+fL9INYx8/7SmNcrAZzYvXagOM/HGnzWdP5Jq/TbSI4VcMmlHv6GtecuVcbYgx+ZR+3kbKmycUGsdWAZb+IBZkMijPsR9Wu4f1bsCQp4ttGHQ8kitQIioZMc4Hysh2G2LTks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hLOML0Kt; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D96E71C0002;
	Thu, 27 Jun 2024 22:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719527697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QhSN+gswhJhYzZia9AYJut7HAbSQRvAwzrg+PCmSmQg=;
	b=hLOML0KtDtKfaRf7RqxU1K8yIhgZH6jOSbHRSK40nbAGr47i5o68SGEy86JnBM2Cd7ObvK
	LmUH31SIn5tjkpO6JLPBtVjcA/HuBZd8dHiG5+VLRsoNX+JEwgUURebij6sbzP/27f//Wf
	y6kXy1bWog2vmnxVyqsSeoJgNIkHq9MwNrL3S3dfNNMhx1B0fDPDrT8vP4tkDQfP72LqPD
	6tKag9eajICMekEwAMSCQX66NTlALcK6HF047VHhhd+rEkZHXhRVPbvfw04G9P66Oyzb4H
	+lgOO10dPRpCLV+HaqMEAqbWLCHfwB7ivwGYGa/WRts69Eug50wj3e/fiUiD2g==
Date: Fri, 28 Jun 2024 00:34:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-rtc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] Update correct procedure for clearing alarm
Message-ID: <171952768202.522224.991669838508358396.b4-ty@bootlin.com>
References: <20240618152635.48956-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618152635.48956-1-biju.das.jz@bp.renesas.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 18 Jun 2024 16:26:29 +0100, Biju Das wrote:
> As per the latest HW manual[1], the INT# output is pulled low after the
> alarm is triggered. After the INT# output is pulled low, it is low for at
> least 250ms, even if the correct action is taken to clear it. It is
> impossible to clear ALM if it is still active. The host must wait for the
> RTC to progress past the alarm time plus the 250ms delay before clearing
> ALM. Apart from this, there is an internal delay(~250 microsec) from
> setting ALME = 0 to disabling the alarm function, so the user must add a
> short delay of greater than 250µs between setting ALME = 0 and clearing
> ALM.
> 
> [...]

Applied, thanks!

[1/2] rtc: isl1208: Add a delay for clearing alarm
      https://git.kernel.org/abelloni/c/0dbd610c426e
[2/2] rtc: isl1208: Update correct procedure for clearing alarm
      https://git.kernel.org/abelloni/c/43696b3a9e46

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

