Return-Path: <linux-rtc+bounces-760-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B986D605
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Feb 2024 22:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3B81C20985
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Feb 2024 21:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605E316FF28;
	Thu, 29 Feb 2024 21:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Lqeq0OgF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD69716FF24;
	Thu, 29 Feb 2024 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709241717; cv=none; b=SAi/MjacdAfCbDWJVW27kGpUao0U/r7Q8RXHT/FNWpj41RRh/v1N8clGltuDAz7s4hf2xW/hAk5+Xmywd1EGcOX/eYVGKf49sc4xipv0lYMy/yAaTynvxGlfvmHs10biTe7dlYw8/9/M+R1pXoiBVWsA5UoI3JOnyOGZFif16Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709241717; c=relaxed/simple;
	bh=hPG2MSbjn3287ySFDIDtVz9dZmejvwT4HapHOm+5VXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMcE3H593chotK6PM8oYN1od3OBVzMQ4rGatBEMdQiFhockma95ZY2mfBqBOjTVz2tK3lUm0jT6HdUZNzcMhUsc3wTBjhqdbq9eOeR46a2ELH5Vm4I4sGDlbntXF5SnscDDK7pifzlh+oAg628EQHx55sxswbWoTNjj2q3GFIsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Lqeq0OgF; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7767660004;
	Thu, 29 Feb 2024 21:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709241712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YtiBd2LSB06AwOHaUeGaoTZv5dyC95eto5oEJCBxbY=;
	b=Lqeq0OgFbcfhGFB2S+WinpRSPBLz9Us20KdYIRpoJGmIBjz3eK+FMOxC+gthGCoE/fFKvo
	OQE0wr0yRemEBGvnSVa658owIYZ0pe9ywQfi7ORgwwhDj9ITjnO1BwxKkWdO6yU7QFGT9L
	LkhlOxl1eORcgj0yian/UzmLtdZxU427AOaSa1+NWr77yF7bFZ3IZHLwe5DnQkaorxSPeG
	V+G18F59FywqjtxZl2QRAFjd+FiFNZkGsLo4Ka9Ap+2JSew8lo5QNRvtaPKZguhX/fVw+6
	DSQscCIhw6+QDc2aLG3s4d9i6+EDFtPgHknBwHeEjfb9R24e95c/RhGPZJCYng==
Date: Thu, 29 Feb 2024 22:21:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Ran Bi <ran.bi@mediatek.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: rtc: convert MT2717 RTC to the json-schema
Message-ID: <170924169920.1873482.11406048934982757536.b4-ty@bootlin.com>
References: <20240122124949.29577-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122124949.29577-1-zajec5@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 22 Jan 2024 13:49:49 +0100, Rafał Miłecki wrote:
> This helps validating DTS files. Introduced changes:
> 1. Reworded title
> 2. Dropper redundant properties descriptions
> 3. Added required #include and adjusted "reg" in example
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: convert MT2717 RTC to the json-schema
      https://git.kernel.org/abelloni/c/e8c0498505b0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

