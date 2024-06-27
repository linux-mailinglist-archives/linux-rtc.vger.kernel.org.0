Return-Path: <linux-rtc+bounces-1409-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CAC91B220
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 00:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3CECB256C1
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 22:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1529B1A0B06;
	Thu, 27 Jun 2024 22:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="afJoYPpS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328791A0AEB;
	Thu, 27 Jun 2024 22:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719526940; cv=none; b=gNthvsZgzgD3UVALU35r8pU8/NgJ13LAG4QxoAlGIvgqIgFbOhPMy3eQxhljmKrKyrxEAoWfaq//iA1oSmvs17FcGTXDpMy8pBcNoM1HO39Ip5yK5N/fkdoConApXnNdTBaurEeLcByBVuTqCJrpPCJ9q5UDx4Qm3SPe5x1PSvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719526940; c=relaxed/simple;
	bh=EDo6MbYYLTPbV8tVgLLLERPjoo3C0XFzhz97q3pg2ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAJsIJFOtPzoDokfUEp29Px1la2ZcOgdWxxrSCeFBeHxgf+379tdQmU+BmKBgTJZG8D9O1uZ56ZuFHGEtTXtz6hqr9dtQXAQYXE4YDdLHjayZ5ZJINq6QUGzLC0hCwCTOeCM9c1Q6WR9TzXY/8czKXZeCKPDZphTzd01NKtSkQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=afJoYPpS; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C1F540003;
	Thu, 27 Jun 2024 22:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719526935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v0626qApZmROB3GjoAw5LcogqxWKQCi8QoIJ3rvjXBs=;
	b=afJoYPpSBJF48Yzveug8x1sqo755AbZDtZ0l2q1l0PEop3v5X0P2mdIWRwezaczuTR6z4O
	AxxNQcIHSDxMiPGUVSiod5Y1jBO17DPUeUMJi1/LcfgR9nmLpvyglZoqXERw+fxt8cwp2C
	596hmjxV0djjUgRZFci974x0XqZHzEK4+8L12k3Swkfy99M+0lhlMYFLMRp4SodwUGzml0
	FQfOO4QsTy/Zs/2vST2Y/WnffH59iO2V6uM5kBo5okP4x0K7pKTm1UjAMU/gCgYGMIhnHA
	gpBbguZ6eL7rIbLvtAyozF8dE8sDE8YNdcqWJIOHlc4V6WEnjCdihExi0g3gUA==
Date: Fri, 28 Jun 2024 00:22:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Joy Chakraborty <joychakr@google.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rtc: cmos: Fix return value of nvmem callbacks
Message-ID: <171952691798.520431.5224005247687748175.b4-ty@bootlin.com>
References: <20240612083635.1253039-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612083635.1253039-1-joychakr@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 12 Jun 2024 08:36:35 +0000, Joy Chakraborty wrote:
> Read/write callbacks registered with nvmem core expect 0 to be returned
> on success and a negative value to be returned on failure.
> 
> cmos_nvram_read()/cmos_nvram_write() currently return the number of
> bytes read or written, fix to return 0 on success and -EIO incase number
> of bytes requested was not read or written.
> 
> [...]

Applied, thanks!

[1/1] rtc: cmos: Fix return value of nvmem callbacks
      https://git.kernel.org/abelloni/c/1c184baccf0d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

