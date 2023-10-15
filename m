Return-Path: <linux-rtc+bounces-104-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A3B7C9BEF
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 23:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 667A62816E4
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 21:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B26614271;
	Sun, 15 Oct 2023 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZVODqBMV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50AC11CB9;
	Sun, 15 Oct 2023 21:29:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731B6A9;
	Sun, 15 Oct 2023 14:29:34 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1DE8E0004;
	Sun, 15 Oct 2023 21:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697405372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UutE4IGPFfHxshxncqwnXGtssZ1QjnCvLzFkBGRJbeA=;
	b=ZVODqBMVTz8bvoEMcqSSaBKf4DW7G3q5OjIKupkgZ6CDJgM0+X8swu2v4EFAmvawYX1kGa
	5KLUoTGTYajgnnyZfYr3HAtRARdEC5Xlybvlh2S4wNpepojeON/zXMYR0cQFEIp9hi9sFZ
	ATsnpu+jPVDCAt08JEa8Tw4YRXCuSDGPCrOip9lFhw7gjedEg9znnk3y1uLRAnpQVyiDIm
	eLMOfOhwjjc35YbZkxmpi8guo0J3rQW8ob3SuM35OJU+GTrTKCQO9K9RkuQG60srQnk+NN
	Ocy0G8yWRMlow7FaQAbR4YVLDb9Xbyiyx+WQHARdOEzLBEUaQtZQHiGu9rgbLA==
Date: Sun, 15 Oct 2023 23:29:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: microcrystal,rv3032: Document
 wakeup-source property
Message-ID: <169740536023.188213.9142303436258979311.b4-ty@bootlin.com>
References: <20230921192604.70944-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921192604.70944-1-marex@denx.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


On Thu, 21 Sep 2023 21:26:04 +0200, Marek Vasut wrote:
> The RV3032 can be used as a wake-up source, document the 'wakeup-source'
> property as allowed property.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: microcrystal,rv3032: Document wakeup-source property
      commit: dc71c03b0a2937545d2c6ff89d2275890a309618

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

