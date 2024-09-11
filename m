Return-Path: <linux-rtc+bounces-1943-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F33975CFD
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 00:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F76F1F23B9D
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 22:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEB1183088;
	Wed, 11 Sep 2024 22:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ECPf7Hn8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C7917A583;
	Wed, 11 Sep 2024 22:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726093119; cv=none; b=O71aVikpWAGm12A6Qd7YyC8GfD3DHdbxvhe8JHtJBAfJIXAdvMIRg+HE15TocNmjznPOgeSglwjDDhrC7JsCkmMgj04IuImG4oSlOtjTSjXCNBf2BiOZWmpokTYvzMT5B2KSFDJD5NioDSHOLeUq/Op+umj5qZyvBO3nU1y6UPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726093119; c=relaxed/simple;
	bh=FMvX2+eKs92Nr3YCsdgsbM6BWx8NZdmKGwndkHFDnKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiAfWizMKe1zrCJ28WC51jzNJ8uwY6uIKTGuxbFQECzKPW9/fkgpPrY10hTzF1qC/0KSAuZs0nvFJcDGJdWsLaCljPH8/WxLboTLTTn21htBK0n8b5HNPK9qLoaih5J2rj1xTYGxtwey8SlbTyXOArI/4iJzGVkL8VS66aIVTyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ECPf7Hn8; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39EE4240003;
	Wed, 11 Sep 2024 22:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726093115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2lqOoN30WdkuHqgb2/l/snG/mdAXlqeaH5Q/64gFmeA=;
	b=ECPf7Hn8NVNLX5lZ2cAfQSf9n2/6jS8ZobKTDiWRizvtAjhNvfP/pwtnldwEgILor8Iab+
	iwRz+Y7UfePU4kgU0yqx/bEWKqEEu24sWfqrpzpzOUcvxx6OD56QVbznGpSC0OjCUd+lRY
	MmnP2NJbBZlBz3Ua1BaXe3SwjWcNZ4mnfOL9WltI+yweVqy7PPyNtF5gTB+FDTFzAqCYky
	gm+TbAuNAtg9LlvAw/oqN4r9dKMZ97dfPMjO2Jd0dRykhLXD6a/ymwOOe/Cl0cRqLrWxZ1
	s83Y9mo408p3k2OLRzHC6FMNxIoUZRHGDP7ZQ7IjewTXnK+9R4LzawKp7aHvvw==
Date: Thu, 12 Sep 2024 00:18:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: s35390a: Drop vendorless compatible string from
 match table
Message-ID: <172609305462.1547920.17943915166585737819.b4-ty@bootlin.com>
References: <20240826191321.1410668-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826191321.1410668-1-robh@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 26 Aug 2024 14:13:20 -0500, Rob Herring (Arm) wrote:
> There's no need to list "s35390a" in the DT match table. The I2C core
> will strip any vendor prefix and match against the i2c_device_id table
> which has an "s35390a" entry.
> 
> 

Applied, thanks!

[1/1] rtc: s35390a: Drop vendorless compatible string from match table
      https://git.kernel.org/abelloni/c/da1531ecf186

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

