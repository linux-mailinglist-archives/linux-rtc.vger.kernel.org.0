Return-Path: <linux-rtc+bounces-3520-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6458DA64BBC
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 12:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8F0E163D7D
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 11:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7058D23314E;
	Mon, 17 Mar 2025 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gdMgFoEZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C541990B7;
	Mon, 17 Mar 2025 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209627; cv=none; b=R8AszpmLex0ZK9yCz/oMtkVdnODFgXtCB/vDfrVUEO56W2RoABiwBiPQZc3hCbCajUdVFhDkrzojiMB8daTDlfS8HKYEeVhabwP7Lc03reC8NefRgr3ySwFnSC73BKPkZCy8x7zLwWV/wEAIA2pK7fgdr14Vb07ozHFMbbZo3AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209627; c=relaxed/simple;
	bh=WRlevDll+nXln9hTunFagaoK2/y6ZJhbWYGoFtFAlMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RojBJcpHhUSHbOGdZ6d/rvlSCVIs6nbvDkVTH0cLrnfLde+e7rraHT7f8myLyFzPLbqZ1YId0l/7meMJ0ni9Ax+gT0MW7m+AwLIEd11e2kU4OpTDfCETlDr4IsW6kNb76en91vGw8gn7a/mPgtFek00uKbOG0e5IzhSXgef+qgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gdMgFoEZ; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A5074427A;
	Mon, 17 Mar 2025 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742209617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TpyWK+ttvgRrtFWn3UpZrvKLnJz5ZbrkNmhS7BJI+xg=;
	b=gdMgFoEZsEYUQXptv8no5MHZKeGaoKZwY5K4wxMj6+JKBF/rcV2G2Y+SgdNdW/pSqKmhbq
	e85yTuhmeHapyrtBNkqmOyZzCWzsuMiYqaWn3hiWl7Vwi5WcA6TPgOi9Sa9av+hmmcFD5L
	JiOt2GHGQijoKDAfYgWO+8OtPDGdFWJOOD9Qu52coqx9Jd6Tz9BuQjKZqU+jxBTLjQZlut
	gTlTO0kH5Ti8Y4V+4LvZrThVB8A09MPN6fAwsg2NLQM1A5A7gEyEzBnZ7lhqzQw+98UehI
	dUsTm/hfV6Tt98S/FLFJyLWRiNEOgPMFTKeFZiao0upgmI1FG4ebwZ9EqWusnQ==
Date: Mon, 17 Mar 2025 12:06:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: x1e80100: enable rtc
Message-ID: <2025031711065662ac4072@mail.local>
References: <20250219134118.31017-1-johan+linaro@kernel.org>
 <Z87avd83XTYQYIP8@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z87avd83XTYQYIP8@hovoldconsulting.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepjhhohhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnuggvrhhsshhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhrrgguhigstghioheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhonhgrthhhrghnsehmrghrvghkrdgtrgdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 10/03/2025 13:27:41+0100, Johan Hovold wrote:
> Hi Alexandre,
> 
> On Wed, Feb 19, 2025 at 02:41:12PM +0100, Johan Hovold wrote:
> > This series adds support for utilising the UEFI firmware RTC offset to
> > the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> > Elite machines.
> 
> Do you think you could pick up the driver and binding changes here so
> that Bjorn can take the DT patches for 6.15?

This is taken now but I had to rebase on top of patches I already took,
please verify.

> 
> > Johan Hovold (4):
> >   rtc: pm8xxx: add support for uefi offset
> >   rtc: pm8xxx: mitigate flash wear
> >   arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
> >   arm64: dts: qcom: x1e80100: enable rtc
> > 
> > Jonathan Marek (2):
> >   dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
> >   rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm
> 
> Johan

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

