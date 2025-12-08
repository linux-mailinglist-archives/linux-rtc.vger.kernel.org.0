Return-Path: <linux-rtc+bounces-5515-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C29CCAE48B
	for <lists+linux-rtc@lfdr.de>; Mon, 08 Dec 2025 23:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2EBA3005F21
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Dec 2025 22:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037B02E54B2;
	Mon,  8 Dec 2025 22:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="u/94yr7V"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615E121E0AF
	for <linux-rtc@vger.kernel.org>; Mon,  8 Dec 2025 22:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231795; cv=none; b=Arw+u+znjV+f73eVkhyzhXl/W0x91iAGt80spF4A4xqpp074CrjtZXdx8hirLsgtqiqALoFfIlPh3jZ1oqFY0w3HJoGAU15f27YssF65vFmh4U/xvlYU+vPV6LS7YcS7LxclMWrE6lNV7qnKyMLdbyIv857/lF+GABLb5X2a9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231795; c=relaxed/simple;
	bh=J8irHp6MbN2c2a4RVyStaynsf/OasjHQTErx7VEKAK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5wKLl61YqcT13Rd68Fsaz/ojMkkjJZXmT+RxBlh7BcSkP+zJMuj15EcoGGt6EO/s1rZBIJlfg+aPLjzW5a1erGjTe11hb/g+cZdswEjdtClubCv57g4BK28Yf7lZU0ZXySLHJxfCWxz4vZfghE/Luls/7jzEHkw97nYtPg47ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=u/94yr7V; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2DF22C180D1;
	Mon,  8 Dec 2025 22:09:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9AF5606DD;
	Mon,  8 Dec 2025 22:09:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42453103C8D5C;
	Mon,  8 Dec 2025 23:09:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=IpPBmn5Por7VIp81eYBe7WxjsEyiLaoPiOP1GCzp0vM=;
	b=u/94yr7VKJoFAIT4XNcqfKwDGfDww8jQcNrKa80RhoiKz8dI10C+jw63Z8IKyGl+8FIQcC
	PLlFBjx7EFH64SlaAXhzNxWuLf/TlijbJKQUDTnIArKKzcB4Yb+8jGiemMQM+dgg7Rkmd5
	hjc9IEAS1Csuj2rVZMPO9GySBF9PpKAUWMowLF0M1SlbSEyxqbK4Ga7O1F18GyYWFlw637
	ER4ttJKWEiRbwFH2QaFkaVzw570KweYOHZ4tuH8Qd0+x3VeXOzNlbCbhjjHtw96+dMm3m/
	UojUMoSzE9zrBx2IsNwubh8yNpSGtwBYF55SslsB9gD3JOj9nejB+BHFOOsvtA==
Date: Mon, 8 Dec 2025 23:09:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: claudiu.beznea.uj@bp.renesas.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/4] Add RTC support for the Renesas RZ/V2H
 SoC
Message-ID: <176523152343.342815.5815704941932518377.b4-ty@bootlin.com>
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 07 Nov 2025 21:07:02 +0000, Ovidiu Panait wrote:
> This series adds RTC support for the Renesas RZ/V2H SoC.
> 
> The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> (r9a08g045), with the following differences:
> - it lacks the time capture functionality
> - the maximum supported periodic interrupt frequency is 128Hz instead
>   of 256Hz
> - it requires two reset lines instead of one
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
      https://git.kernel.org/abelloni/c/4800046b56a5
[2/4] rtc: renesas-rtca3: Add support for multiple reset lines
      https://git.kernel.org/abelloni/c/6ada8e24238d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

