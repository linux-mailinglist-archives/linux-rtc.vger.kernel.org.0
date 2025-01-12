Return-Path: <linux-rtc+bounces-2889-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC1A0ACAD
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 00:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D5817A01CA
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2025 23:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1131C2317;
	Sun, 12 Jan 2025 23:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BoAaLfK9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05096154C0D;
	Sun, 12 Jan 2025 23:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736725213; cv=none; b=Xak3c2uV1VtbeA5ZjBbi7vVUF3YyhWOtEtXZ14ygLDIwlzXD/q68TNq1dtGQLcv6UU7tMWSzg9dDciQkj/+ynIcilFJoNhpGHZ8fknl/3XDG2pNarhnLm7l4Go17UXei5Cp2zBnsVQr+8d/mRccVAFa+S/7ODsM4Qg4VGvyfrdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736725213; c=relaxed/simple;
	bh=Mq7atc1hwDk4E1VmiDdknyuPsj2f3PqV9aGWGsyF/mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDcS4HvYR+io/ybbAD/n1F93CBs+7J1MOECMLMnuvgKT1nFNVfz/ErtkPWErlVlTCSE9SkvfeM/dgBJbdFy1bTF+YboEyfPe8+HgP5x76RHhT7ADTsGHeIi0olSlauD8/A+0444DeyYFOfqU3Bd2foBt+JIEVlaEBpUCr4qFuU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BoAaLfK9; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43D0B1C0002;
	Sun, 12 Jan 2025 23:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736725203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YL2oZKU7n0uUlLHGOVq154PVrhK1qxhApkmk4APiOz0=;
	b=BoAaLfK9at5Ot+H3bpzSSFn+Cv8kt6Y20jlUFTKQS9nIvJ6jEEI3wgiO4r2feJd3TZiuhg
	S/KtswvbujifFr797gjNSt74ejAXRdz68wFT5WElsk1jmUG4DGITB//cWqmCgjtBwnkVCT
	Aa7imfMv5BDO8+2IhJwOsmu2nVs471cJZcxwz/Y7qdkJGScRe3szOE6CdD0coawI5p8qwm
	HMZD8WuEGX/nbDFfD0AVsOMxhYfZvnqKEOC6NUQhUpfN2rFxDFeVw82wrllIZm7EOgoCy0
	+27Vjg/bb5A1Wz8+tp/8So909HQGqZVdhSrpw48SJC93S2IrHqbvjhlaBPISaA==
Date: Mon, 13 Jan 2025 00:40:01 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, WANG Xuerui <git@xen0n.name>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Ming Wang <wangming01@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, lixuefeng@loongson.cn,
	gaojuxin@loongson.cn
Subject: Re: [PATCH v2] rtc: loongson: clear TOY_MATCH0_REG in
 loongson_rtc_isr()
Message-ID: <173672519435.1488553.1230962968393276759.b4-ty@bootlin.com>
References: <20241205114307.1891418-1-wangming01@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205114307.1891418-1-wangming01@loongson.cn>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 05 Dec 2024 19:43:07 +0800, Ming Wang wrote:
> The TOY_MATCH0_REG should be cleared to 0 in the RTC interrupt handler,
> otherwise the interrupt cannot be cleared, which will cause the
> loongson_rtc_isr() to be triggered multiple times.
> 
> The previous code cleared TOY_MATCH0_REG in the loongson_rtc_handler(),
> which is an ACPI interrupt. This did not prevent loongson_rtc_isr()
> from being triggered multiple times.
> 
> [...]

Applied, thanks!

[1/1] rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr()
      https://git.kernel.org/abelloni/c/09471d8f5b39

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

