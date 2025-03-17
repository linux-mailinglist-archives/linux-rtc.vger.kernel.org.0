Return-Path: <linux-rtc+bounces-3518-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A5A64BBD
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 12:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74445188AB9D
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 11:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42A923372E;
	Mon, 17 Mar 2025 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j079uhq/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640817B505;
	Mon, 17 Mar 2025 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209532; cv=none; b=MvPGeqF5dsyVODtvOU+1AGzLQjyyo+ZiLcEs801M5D8fkbiGtxQKSnhJZpq0403zv8VhCb3/OgygAxEvK6QXdl3sTvdI4r98v5viI/ZF/3uWBRnf7LUVYcyJ1yEV8EHJgAn1Wol2SbSkabnGgNuAzK0AXwc10G2DUdyjjIK5R20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209532; c=relaxed/simple;
	bh=GYc9Zxpoy+VcEZbegBnAnPClvWftI1Iw0GzAhp1JQVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHaLoQs1k4apo/+ZSSGNa2MlOLLLb1nTW1eItKd8YWm8K6/e4/79VcTH4A2Qy55cfDsycwBGZEHlWdSZXNz9bL/DuNxcZgBrXb4hMpSJC0SaC4+pafbYmVtQW5ohIsxtJdYw3JsR1W7tNSEn0tHlM28FWpxNzpMVJRtlQKSjd5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j079uhq/; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D794B44202;
	Mon, 17 Mar 2025 11:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742209522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oRaKAbJwEnOpLBVHHavXi3aLRuKUPcVKL28ZN6CK16M=;
	b=j079uhq/BKfz7C1fVe9hRsQjsE7B9cz4gF9bkr98jjBQYPFMWB5YQn3qGVu5+UVIgm3BIu
	TRn4MjxMjNH/bPBgSIU0Sy5bCTeQkSH/8WC64yiK2wguSU1q1UAdS9r4SYcTv+nh6JePsQ
	Uirsy4kuHB5RhizcXhVgQ2EUjlTtAGF4F4nSbg9wjQBdtQZ+LvN0phU7pwM7hyFYlkvl8N
	ZEJGhqzlWbtvDnLfIOJwcdyq1ZrpfTjkWAJTeS6GBm/ghJIRvO3x80QC3jqIYwX01hVn/5
	8mtLoAT+hDJwplbRKH6I7UU9CI+xEixWG0joaBWuem1Snw5Emhh5GLugqSeyXQ==
Date: Mon, 17 Mar 2025 12:05:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Joel Stanley <joel@jms.id.au>, Sebastian Reichel <sre@kernel.org>,
	Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/6] arm64: dts: qcom: x1e80100: enable rtc
Message-ID: <174220946669.1513178.12624130595965879949.b4-ty@bootlin.com>
References: <20250219134118.31017-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219134118.31017-1-johan+linaro@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnodhlihhnrghroheskhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhrrgguhigstghioheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhonhgrthhhrghnsehmrghrvghkrdgtrgdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 19 Feb 2025 14:41:12 +0100, Johan Hovold wrote:
> This series adds support for utilising the UEFI firmware RTC offset to
> the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> Elite machines.
> 
> Included is also a patch to switch the Lenovo ThinkPad X13s over to
> using the UEFI offset.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
      https://git.kernel.org/abelloni/c/931a88914ad6
[2/6] rtc: pm8xxx: add support for uefi offset
      https://git.kernel.org/abelloni/c/bba38b874886
[3/6] rtc: pm8xxx: mitigate flash wear
      https://git.kernel.org/abelloni/c/e853658de5ef
[4/6] rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm
      https://git.kernel.org/abelloni/c/28e5a73479fc

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

