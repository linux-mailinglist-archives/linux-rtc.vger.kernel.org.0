Return-Path: <linux-rtc+bounces-99-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4957C9BB6
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 23:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 256F2281678
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 21:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21DF12B74;
	Sun, 15 Oct 2023 21:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ENcQum01"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E475F9D7
	for <linux-rtc@vger.kernel.org>; Sun, 15 Oct 2023 21:04:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15AD4B7;
	Sun, 15 Oct 2023 14:04:01 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4275240003;
	Sun, 15 Oct 2023 21:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697403840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1OtzKS+ZE0gLEodAJqaYLXSJ4vGUZAq2NAwhWxZ174o=;
	b=ENcQum01ypQhY9RbkdZ1iXD3eNEVGNB86Oeq4O2bM+Cckw0Rl8NpNJ2hf84agdFLShsrRO
	BDxq4Sbm0RdsPHYZQJpH+Xu4tvEHesnj44yRw/uHoAdW+WrwF+CG9lXGUeo06IsdQ2dejR
	279gQxszUBgkdkaj7zApbUn0v39QPUYfo1RqW1ukRKNpSvNGS1nRS8edwZdzFmbWlY6MB1
	l92af7LUG8leVT5zb/KhWjVrxD5K6JRIXYkgRgL33C/BOKa7E5nXVfoNGFQVUY8kBgj9aH
	kqH2GqM/9K+FvndE0uu5DV3ViVocsfxqRmR5XP2LFRkZIhtJ3iI7SWQCg4PpEg==
Date: Sun, 15 Oct 2023 23:03:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: omap: Use device_get_match_data()
Message-ID: <169740375018.169509.5893287269026220454.b4-ty@bootlin.com>
References: <20231009211356.3242037-12-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009211356.3242037-12-robh@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


On Mon, 09 Oct 2023 16:13:42 -0500, Rob Herring wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
> 
> 

Applied, thanks!

[1/1] rtc: omap: Use device_get_match_data()
      commit: 3c8bdc20a44fd0126e331e0623e7daf00d186135

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

