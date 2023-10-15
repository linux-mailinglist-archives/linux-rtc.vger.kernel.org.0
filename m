Return-Path: <linux-rtc+bounces-105-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D97C9BFD
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 23:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F77A2812E6
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 21:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CA014A89;
	Sun, 15 Oct 2023 21:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NWMEUIrP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82F615D4;
	Sun, 15 Oct 2023 21:48:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42061A9;
	Sun, 15 Oct 2023 14:48:06 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57C81FF806;
	Sun, 15 Oct 2023 21:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697406485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Mo1zdiF8qX4RNc1NXuxfSMRi/ufFekjBlc8TKG4Dcg=;
	b=NWMEUIrPXvCnKwbEMBWrSH4+8yqPhTwLJ886vY5MmLqYjhbxvHOcdai21yB8QqgjJCRTdq
	nj5FDwDu2CovWDXcC0R+FXfB1fPoxiRaLW4daxzrYIvJ/Hz+DylkZeCYMTsULQaM80oEyA
	ePJg/IxR4pP02K8UA89r8HmxBLxJJ2acoowT224SjfV+KkB9n5X+HR1jzK7QqtOcVVEXpw
	5mQsxa+5B4rsTVjYdeQqSr8ep1fT7NpHcxoN7YFeO/ZQwFHBL1Mrf2lzqPfZqqBGlzT/3y
	AzvhyLqgKkoaVrm3i/CA4FriHeYYouy1z85SJBuwJcZ1PVAKHDzA3tBi3d1+xg==
Date: Sun, 15 Oct 2023 23:48:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Romain Perier <romain.perier@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Daniel Palmer <daniel@0x0f.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] rtc: Add support for the SSD202D RTC
Message-ID: <2023101521480226f64b51@mail.local>
References: <20230913151606.69494-1-romain.perier@gmail.com>
 <20230913151606.69494-2-romain.perier@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913151606.69494-2-romain.perier@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello Romain,

Sorry for the very long delay,

On 13/09/2023 17:16:04+0200, Romain Perier wrote:
> +MODULE_AUTHOR("Daniel Palmer <daniel@thingy.jp>");
> +MODULE_AUTHOR("Romain Perier <romain.perier@gmail.com>");
> +MODULE_DESCRIPTION("MStar SSD202D RTC Driver");
> +MODULE_LICENSE("GPL v2");

checkpatch complains rightfully about GPL v2 here. If you agree, I'll
change this to simply GPL.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

