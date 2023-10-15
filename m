Return-Path: <linux-rtc+bounces-100-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7828D7C9BCD
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 23:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19D0F1F213B1
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 21:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF384134A5;
	Sun, 15 Oct 2023 21:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZfoVRvjV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD42112B9B;
	Sun, 15 Oct 2023 21:16:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E75AA1;
	Sun, 15 Oct 2023 14:16:22 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06986240002;
	Sun, 15 Oct 2023 21:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697404577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EGywzKZdFtwdrYNhyH7b3glgSwfEO4bz01ZWwcPNTSI=;
	b=ZfoVRvjVMvDJEIFHPs9WErdaBSS/tk0OyweMZ5MZpFR/7ZOlJ2zVhYnlbqliCwr7JlKbiw
	IaIj5FbcRLNIjY3Vn4zicJTpEPfcP6geJpca3axw+ZRFqB5Xi199ZD8xRQ1Mxf9+Xyjmcf
	pSmTCkUUCMqN4K2gSa8OrpDYXCu9WVc15ggZLmml3QWbZg1R23TVzoRUYTxl6k1xg9DOIf
	3/baRnUb4iCanG0P6NCSJzZzGeR+yDt+7zOroCRSDLBlI0PQ5lHTUx8kkHLHHxaeqVs1LJ
	tFcBXUrTRAaCuEVul5gqWX4GxSVJMXqYy7th0+l9KTR84OrpsXoRtvBlu4fd7Q==
Date: Sun, 15 Oct 2023 23:16:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: rtc: pcf2123: convert to YAML
Message-ID: <169740456168.178194.5589245634078724588.b4-ty@bootlin.com>
References: <20230907-topic-pcf2123_yaml-v2-1-ea87a8e12190@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907-topic-pcf2123_yaml-v2-1-ea87a8e12190@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


On Thu, 14 Sep 2023 11:07:59 +0200, Javier Carrasco wrote:
> Convert the existing txt binding to the preferred YAML format.
> 
> The pcf2123 node may contain SPI settings such as spi-cs-high and
> spi-max-frequency, which keeps it from being added to the trivial-rtc
> binding with its current definition. Add a reference to
> spi-peripheral-props.yaml to account for that.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: rtc: pcf2123: convert to YAML
      commit: fdaf4c5acf268bfcc455d8c2ab775cd54317c788

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

