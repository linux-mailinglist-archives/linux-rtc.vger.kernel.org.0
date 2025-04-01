Return-Path: <linux-rtc+bounces-3713-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 098E5A778E5
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Apr 2025 12:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 087D13A97D3
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Apr 2025 10:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078421F0996;
	Tue,  1 Apr 2025 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eUQNSxy1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C311B1EF0BA;
	Tue,  1 Apr 2025 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503717; cv=none; b=mojoQg2+im6d59jKFOb3SWTJ2XkuMpXphCIA+jBB4zJNfhyN9hTI7X92KDYO4FdMKU7/ScEqBKFTi9pXxAurZklBeZ6CV3ZG3rUbsK83NfjVGeVfV2cfG88SLU6fjsHuTIcDzUJLUjqoE41PV85sHVuubiT/hK81QJiKxU4Ob6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503717; c=relaxed/simple;
	bh=i1uX15IyzqsZWb/TvH5+a4SBwYFcxwU6+oaSdvqPc3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyQ6pb3QssjlkR2zGiMqNu4cSCtMPuEalDCVY+0s/Hp1cx6dKQuXUPxd6WtAPRMXRiawqmqK9ZvaIVNVp1arcTxl928JkM1fVlRPs2iNr0ZXrlDWMjt1awUjhe6ZyiTwuz8eSAH9RSz3SjdHEAvQzCA6J4NMe7gfelyUtNqGxTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eUQNSxy1; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id A927E5897DA;
	Tue,  1 Apr 2025 10:02:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0E09432C5;
	Tue,  1 Apr 2025 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743501753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JqZFr1OBThFFO2Gb87Cot8+VhO0EETzE4mrpW6VN7x0=;
	b=eUQNSxy1kMTi0sbivzgeK2ZVMxQD4TA3nnkh9fbyQRFRWof0NH13XKiAHJkP6BVseNy6XZ
	gnOsLYZkftbsBd1PjuRVIUMuEDH1JdmsL2xFux9Jo19x2R6im3a8ElFBVBa/XbpjFgPtup
	qvDw5MdTmNYFBx6+W8vW9xmKeZ6Wt7Wl7Fl/AGqwjxbbZw2BJF5X970qwfXaI36wyNch0h
	waaraiUoxxengtjVzrsE3JoLrB0QeL+xu3cOUHo1ZoAPYdT8RUEgkdBtCSFV8vA6E5BLe3
	Hjixi+ZvvX2PfFQOCISzEXXU5aa5nPMqX/ocmhiDj3NfHO1XUqaVz54O4JBh2g==
Date: Tue, 1 Apr 2025 12:02:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf85063: replace dev_err+return with return
 dev_err_probe
Message-ID: <174350173761.1869522.4017225429652916450.b4-ty@bootlin.com>
References: <20250304-rtc_dev_err_probe-v1-1-9dcc042ad17e@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-rtc_dev_err_probe-v1-1-9dcc042ad17e@gocontroll.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegrugdtfeemgehflegtmeeffeejfhemfheffegupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepmhgruhgushhpihgvrhhinhhgshesghhotghonhhtrhholhhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrr
 dhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 04 Mar 2025 09:14:52 +0100, Maud Spierings wrote:
> Replace the dev_err plus return combo with return dev_err_probe() this
> actually communicates the error type when it occurs and helps debugging
> hardware issues.
> 
> 

Applied, thanks!

[1/1] rtc: pcf85063: replace dev_err+return with return dev_err_probe
      https://git.kernel.org/abelloni/c/119e90a3a64d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

