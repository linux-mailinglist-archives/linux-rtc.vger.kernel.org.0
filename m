Return-Path: <linux-rtc+bounces-2516-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EB29C48BE
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 23:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1DC6B29EAF
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 21:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115CB19D09F;
	Mon, 11 Nov 2024 21:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="krU2bcpK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B000165F1D;
	Mon, 11 Nov 2024 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731359736; cv=none; b=Cavsgkz6dyDmOipXfPnhCkVZ0cSajrs2/SPSwRuCZX05omR2pGq/GJ8jdHMwvjxT5UmgzoV6fX0gT/7p0tvNmjRu2V+EmN+ijQVkv+L2KkOoC+dKsv6Pfqc/sKC6PQa2fJ08YrhfPr1LkIMNythxvXDQrhU3XDYgS3xYECOmj/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731359736; c=relaxed/simple;
	bh=3HkoC7qF3wi+INF8yzbmJK6OkoL9iD18zgwWERBqtwA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiTm3qer1mL/gBUWgdzHYPUL9FyJtzvdo0ib+JMKqs5Eb3q29hwqhAnj0R7qDxo4p5ZUF1HA7YsoG8J+UwZO4JCpNtuTn8gGYiv/iKYSQOewQ8nhGRMzWzRMpAKuo46YNY/uTgBCESIu9MlBxb4JZFkecVWtAtCrhefW4A7YN0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=krU2bcpK; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CC8820002;
	Mon, 11 Nov 2024 21:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731359731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=95CCffuoHf23gj6Rngk0fanHvAdGlkB8KQvC7LGpDE0=;
	b=krU2bcpK1xBJfd7LyNURDYSWO6WPhJi0cVyyTS2+/+OMTuXO3eFJq4h1edORPg2fxV+EH7
	irDJXvs1hWfEKMm/2YGar5ICfTqg15fFExQaswBBDBloQ2mmdfjrT7JpOOspQEaBr/DKC6
	B/y8mE4k6jBpd2RnNH9hoV4ofPIWywjBJ1NAi7nDVuoVkXpuc16ozqQuNUyVoF5ps07vet
	+te/6F2EpA3Frfmm6A9Qg6mM8nvDd+UlpmMtEkAg1LemNWIsj0xOD+Jme+Lf+XAuGL/TsW
	7QFLD7ikonUu8oApNx+kSiXBJEjao2ZrBtVcafLP/1dEyoXUwIP/WiYKVW5ZZw==
Date: Mon, 11 Nov 2024 22:15:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: Re: [PATCH 0/2] rtc: pcf8563: Switch to regmap APIs
Message-ID: <173135970735.3306948.8954999784918802505.b4-ty@bootlin.com>
References: <20241010084949.3351182-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010084949.3351182-1-iwamatsu@nigauri.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 10 Oct 2024 17:49:47 +0900, Nobuhiro Iwamatsu wrote:
> This patch series switches the RTC pcf8563 driver from
> i2c_transfer methods to regmap APIs.
> 
> This series was tested with PCF8563 chip.
> 
> Nobuhiro Iwamatsu (2):
>   rtc: pcf8563: Sort headers alphabetically
>   rtc: pcf8563: Switch to regmap
> 
> [...]

Applied, thanks!

[1/2] rtc: pcf8563: Sort headers alphabetically
      https://git.kernel.org/abelloni/c/b263d7c10212
[2/2] rtc: pcf8563: Switch to regmap
      https://git.kernel.org/abelloni/c/00f1bb9b8486

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

