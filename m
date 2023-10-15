Return-Path: <linux-rtc+bounces-102-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD997C9BE1
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 23:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D65522816E5
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 21:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5290C13AFA;
	Sun, 15 Oct 2023 21:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BGkgkHjn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C69748D;
	Sun, 15 Oct 2023 21:21:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A65A1;
	Sun, 15 Oct 2023 14:21:23 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22116FF803;
	Sun, 15 Oct 2023 21:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697404882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YoKUC5pzXnoAc8cnVL/2jr7h9gvSzuD5pVN3GOncqXQ=;
	b=BGkgkHjnyjFPakWW0ukocCtaJ2/0+zcSibN6HMv8Dhs51F6bRMdA9z7KWSZWgazwGXzVg6
	k/sK+mNK7w8OuIMRux+/FsrusJ52RouGIylSoJTMiNG+rasTbTQtTNGLiLUPVwd/MYW3Zc
	zgU6I8c7c5QERpqTRkj/2DSqP7AgSF49edrYdcnw8xs5I9o2CzMYiP3rkr/h9UHJ4WINXu
	NEMBkheUEo5BeXpI/TVoTxCLLAivlk2/UVaEnyDkfip7s3rMI6l5XuDBXSuzfwstj0lCDr
	iXoS9tKcypWzfCz2Z7biYPg1Wze732vjMe89lw8XkwjDapzOHkHgFnlxunCIuw==
Date: Sun, 15 Oct 2023 23:21:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Bartczak <emilbart@gmail.com>, Josef Gajdusek <atx@atx.name>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: rtc: mcp795: move to trivial-rtc
Message-ID: <20231015212120b4b347a2@mail.local>
References: <20230906-topic-rtc_mcp795_yaml-v3-1-5262f1b39920@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906-topic-rtc_mcp795_yaml-v3-1-5262f1b39920@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 06/09/2023 15:34:06+0200, Javier Carrasco wrote:
> The current mcp795 bindings in text format do not support validation and
> are missing the optional interrupt property that is currently supported.
> 
> Adding the missing property makes the bindings identical to the existing
> trivial-rtc bindings.
> 
> Add maxim,mcp795 to the trivial-rtc bindings and delete current .txt
> bindings
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thanks.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

