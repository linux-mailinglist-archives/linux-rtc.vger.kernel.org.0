Return-Path: <linux-rtc+bounces-4868-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CCAB53597
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 16:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4F0C1CC2F69
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 14:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E804B343204;
	Thu, 11 Sep 2025 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtKZYPas"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20F033EB13;
	Thu, 11 Sep 2025 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601220; cv=none; b=fjIOjBanb3qq+A13DtDZibRIy4a6YtXHZktl//LgWWhbB+9PvBrMslKVDjyRbU1X1G4VB3bcoJyUN1bAU9wGDkgVoZmfqZhQi3UDDHR1Z4Fv3iUzNGV6BNk6ATTvWFe0OrpSEu9eNw4zb39Zb/o/Vo2FGLVbIsTbjRx7q4Xh9FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601220; c=relaxed/simple;
	bh=2eYJl4viPtBsGhMcpLBoQoi+Q2EF+GYl35o5GJIsPD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mRHYA9/hw71UW/ZaVuVy1nZIIOHxHO7MuwmrzKS4nAP1LjwT8SDVEEoy+Di3enwBUO6ftWQbHtA/Z1VgYJVPKJyGMNCMlIuAXG4QFZyGoel113aAB1I8B1NOQLQrux4x5GcQcgCR1WcGfYXH5jT6Nx1HFdlc2Q0u4ieyx7oS4DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtKZYPas; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5F7C4CEF0;
	Thu, 11 Sep 2025 14:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757601220;
	bh=2eYJl4viPtBsGhMcpLBoQoi+Q2EF+GYl35o5GJIsPD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UtKZYPastdPMxQ5bxQI7chOm3A+u9YSvxFf2Ky3cxZlsB3PV8jhOtVQJSsgbEi77t
	 Mfq6ruaTj582aYyzfxKU9w8TN2MHj/1pULjzkpkDx0SdRFg6sRnYojDFe/r6ZiK/EO
	 F/c3mCmRyjngWZYh39wnbaBDmq/CKTjmuXWxAU1H03JeLpujF/5USVK+yjMr2JKZLG
	 Lv0V8U5CgLDmTQJOHhkhtylI1t5bQw5f8CLkYPpe/Ns5UYTuZwzZ8K4glnBjS/G3Ti
	 PPTaUxlcYLsikIB32P28uisjhR0poDukeqvVocIZ6aUifksoIBN7UcHSP9paMb8d/L
	 5kfTIdZ07w57w==
From: Lee Jones <lee@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Alexander Kurz <akurz@blala.de>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-input@vger.kernel.or, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org
In-Reply-To: <20250811064358.1659-1-akurz@blala.de>
References: <20250811064358.1659-1-akurz@blala.de>
Subject: Re: (subset) [PATCH] Drivers: mc13783: remove deprecated
 mc13xxx_irq_ack()
Message-Id: <175760121893.1552180.4985563668689994251.b4-ty@kernel.org>
Date: Thu, 11 Sep 2025 15:33:38 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Mon, 11 Aug 2025 06:43:58 +0000, Alexander Kurz wrote:
> mc13xxx_irq_ack() got deprecated and became dead code with commit
> 10f9edaeaa30 ("mfd: mc13xxx: Use regmap irq framework for interrupts").
> It should be safe to remove it now.
> 
> 

Applied, thanks!

[1/1] Drivers: mc13783: remove deprecated mc13xxx_irq_ack()
      commit: f0addd325ef692c92c522a2ba4d9db13fc90e664

--
Lee Jones [李琼斯]


