Return-Path: <linux-rtc+bounces-4900-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F02B56CF0
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 01:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54F4217864B
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 23:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0E624466D;
	Sun, 14 Sep 2025 23:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RZ9cWh74"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827B023909C;
	Sun, 14 Sep 2025 23:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757891924; cv=none; b=bLDPVkrgeXQZsbYOe4ivEcXp7OoHpoRbb//9oBqvuhzKejbHjjNEpFtwE30PEW9Qc+5LNWvg8vHSLH20Tbp4Dm0Gymc6GR9VB3NKXIQYJn9eMutvKhIMajh35NAyNSB1pXSJBoLFtGey0jRFsJtOqYqnTwaARYRjShrh38PrqBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757891924; c=relaxed/simple;
	bh=owoiE2+a0fU7T7scY+nSlS9EWC8wWpLinLlp5irhkjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfXpvc4TeYpKB69a34PqbqGZv0MrMYDOiG2ZafIgpQ5fWe854imIEOMX/+dOizBtU6sQVDs3P8a5cS2VYFCp1HtpzYZPSeY7Y7ziimP6v/lfYJ6XogctshUohq70N8nPBAq7SrYpZGOdarbuLIipSKoDOtNG9SLu1to95wPN47o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RZ9cWh74; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 639A2C6B39E;
	Sun, 14 Sep 2025 23:18:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C57A6063F;
	Sun, 14 Sep 2025 23:18:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D2C2102F2A7F;
	Mon, 15 Sep 2025 01:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757891920; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=InLhKcpHVNtmYglLzf2fc/rNJemJ2rA9lGwWtAsypig=;
	b=RZ9cWh743rTTOxfOLdk+PNt2Of0Clc1T79o8UcLKlrv6BLHnVsrns9prVgwCGTz8vmN5XQ
	I4YQtlNiMyGwX+7PO715nxQoJ5oCnlgiyF8aMykNLwmO0aMuddqQ/JJ9JJxflWH4v6zjrT
	JyYKBV6ko25K2wOXiS7wOViZH1HiOWukEKmjR1HOQvnZebgGZAP9RuLKMLB5k7moC+DyNF
	diAnolqfFV1LDlJ2mifyh+GICgK/LCBl9Q/QgbuTjvoFoi8065TtqavbXL5IfH0/C6QNmC
	23/ZrU9CdspcRlkFBSbxD7UnO0bREq8NbIXVxOFr8Pb0PJnu3Kd25XHzykqL9w==
Date: Mon, 15 Sep 2025 01:18:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: Drop isil,isl12057.txt
Message-ID: <175789183738.411954.733036125801814924.b4-ty@bootlin.com>
References: <20250807214414.4172910-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807214414.4172910-1-robh@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 07 Aug 2025 16:44:13 -0500, Rob Herring (Arm) wrote:
> The "isil,isl12057" compatible is already supported by rtc-ds1307.yaml,
> so remove the old text binding.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: Drop isil,isl12057.txt
      https://git.kernel.org/abelloni/c/5eabddff9168

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

