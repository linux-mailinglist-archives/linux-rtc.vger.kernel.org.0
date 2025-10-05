Return-Path: <linux-rtc+bounces-5051-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AB2BBCC36
	for <lists+linux-rtc@lfdr.de>; Sun, 05 Oct 2025 23:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E5FCF4E6623
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Oct 2025 21:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D7D29A310;
	Sun,  5 Oct 2025 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RM1RJk0x"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE1729992A
	for <linux-rtc@vger.kernel.org>; Sun,  5 Oct 2025 21:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759698688; cv=none; b=QSJgCs+OEW3jA8HoH+CbZ4/dxlNecc0Ecc0569pJ4S2MztmWVjKmu1bVkSqkCF2/rQUZ3WRJdHJQ3Jz6RTKdwQyeUh6J//mRQjoZHxInv4Lv619fJSXv3MCrk8n2xN8f9/o/MNNc5OQi0uAnVe6pXWC3a5XA9hcvgCqkiJijvhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759698688; c=relaxed/simple;
	bh=P0z49LV2F5xIuHoN7OyT7o7JK+TVZX13u8hnZz4vGws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdRe1TNkVqC56SVmjP8s9vz4LuRNsiEqj3GlpQC5UnGaXjl4mpamltrA3OxyPdswAtcyvL1vmXLMBlitnJQH9fwOGVJnCEqwKmW3OD5WoLtXvGE7VNnP8OoigEU4H/RVumsIC5Q32/FqDI0RWeHkc6LrUx4IuH7XhYL7eZ6Qdo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RM1RJk0x; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 41E111A111D
	for <linux-rtc@vger.kernel.org>; Sun,  5 Oct 2025 21:11:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A3F06065F;
	Sun,  5 Oct 2025 21:11:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DA24102F1CFA;
	Sun,  5 Oct 2025 23:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759698682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=xvpGG3K+d4nDU+wbv/MSUXfX+rffXV8mpfkj3ipAZ8U=;
	b=RM1RJk0xzPFdOvGQRBinxhKE+SoVE8BQuxvYDLwROaKu6MWEFMq1omGCSCHu3J10zLSRH2
	3t1HJrfXaaYLBjxlq2/JnJSChLcpMhTId2lnmkOdLnwQd93RpXFAn9jN2mVqzPdY0x8GdR
	BdxBooI/vGgjQj5HPKTAPfmF+Y2C+/U9wiJmTPswnuvCwWmCo7daxEL8KFoHenQpcda5+t
	k9N3S46NuLqIgjE2gpfR72ALTqZLJ7BTlVj6wTCZmK52Uv8cnhaUozwHmXSmdH69EN2OCE
	Vv1/d9qBRZ1KiLEFyz64ZdcJC3MKtL3STbcTgKOqdx7uDVty2tV5OgIJim/LdA==
Date: Sun, 5 Oct 2025 23:11:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: amlogic-a4: Optimize global variables
Message-ID: <175969867390.3794197.7569188236054455488.b4-ty@bootlin.com>
References: <20250722-rtc-regmap-v2-1-58bc17187a11@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722-rtc-regmap-v2-1-58bc17187a11@amlogic.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 22 Jul 2025 19:30:48 +0800, Xianwei Zhao wrote:
> Convert a global variable into a local one of aml_rtc_probe().
> 
> 

Applied, thanks!

[1/1] rtc: amlogic-a4: Optimize global variables
      https://git.kernel.org/abelloni/c/f38bdd730914

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

