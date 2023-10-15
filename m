Return-Path: <linux-rtc+bounces-98-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DED087C9BB4
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 23:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98A57281689
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 21:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD86012B74;
	Sun, 15 Oct 2023 21:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BV6KLNXe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C6F9D7;
	Sun, 15 Oct 2023 21:03:50 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C01C5;
	Sun, 15 Oct 2023 14:03:48 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9B9140003;
	Sun, 15 Oct 2023 21:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697403827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pIh16GD2rNLbL2F8pF6pjHQLfyImAKRlB/ejcwykMRA=;
	b=BV6KLNXeS/hKEOvxe0K+IMOjJJKtsY0HxJgjiVK0S0NH3tw/pMD7rXKS/sxkmdqMXmu3IB
	i49jk6mpY7WMYac1/2X7jxgK5jqqk6m/dAZFtyDDnHJ7mCXVA1XJVb+CQ/+EDN+QGJvMue
	qtUiVf4zXFeo54m8adK2CtJ+dii0gyMhko2H1wDAWimTpfHtBmQ0kCa3YFr7PzvwuHh5Ri
	+UIJkv7xOUaxt/AkPaZ8fKH5QsvHWjWqvIvlEVXZXfxeLB/NAwmTzqbx0o8vcIQdED1iTM
	sPzX4KNLbXlvwK/Nj0iDW26xrxwy00XOkeFSD3lfXL72btifj0GdQAS1juOlPw==
Date: Sun, 15 Oct 2023 23:03:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Howard Harte <hharte@magicandroidapps.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Support byte access in the RTC7301 driver
Message-ID: <169740375016.169509.3831513934722070019.b4-ty@bootlin.com>
References: <20231010-rtc-7301-regwidth-v3-0-ade586b62794@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010-rtc-7301-regwidth-v3-0-ade586b62794@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


On Tue, 10 Oct 2023 21:42:10 +0200, Linus Walleij wrote:
> This augments the Epson RTC7301 driver so that is supports
> both 8bit byte and 32bit word access.
> 
> 

Applied, thanks!

[1/2] rtc: rtc7301: Rewrite bindings in schema
      commit: 5ded578a18c9515c2c0e1cd148ca42133bbcf055
[2/2] rtc: rtc7301: Support byte-addressed IO
      commit: 8c767e9c1ef40c9fa73276df801251cef895b569

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

