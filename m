Return-Path: <linux-rtc+bounces-92-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D027C8309
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Oct 2023 12:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95150B20A05
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Oct 2023 10:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6A479F3;
	Fri, 13 Oct 2023 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QaSTc9hQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59951078B
	for <linux-rtc@vger.kernel.org>; Fri, 13 Oct 2023 10:30:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF83CD7
	for <linux-rtc@vger.kernel.org>; Fri, 13 Oct 2023 03:30:34 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBF522000A;
	Fri, 13 Oct 2023 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697193033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYDWkvzq4qWhvJwrW65NU/4kRLPebsd15Q3CJ1rXLeI=;
	b=QaSTc9hQ0GR7eIVVJS1jDMp3hN1U+oZyy42pT4rRKC1AVf5VmQZLFmD279Mbi+56jtf/lr
	cId1wkN7ntf6gW2BGhlCNX0D87R6L7sXqdNkodFyqflRhPCCqq4KMEJ59UZCC4/BPoYnSS
	1NpJP+55WZtF0z/NEfwdUhwOuUuBLcDelyfmewfiwaSUdkU92TTp7aaSs8RxVb6HBT5/P0
	bUvg09Xmu2PJIsOyVotD0BiGoY6cm4KXkjyoE4LHmDongt49/24ndUU+VboUkyj43WlwsS
	bxtFBAKBt4t5pyeL4kXFDA5ttFhLIEKQnY11vRErhLx5Dp5B+vBEdGYUwCf7JQ==
Date: Fri, 13 Oct 2023 12:30:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-rtc@vger.kernel.org, kernel@pengutronix.de,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH 00/12] rtc: various improvements
Message-ID: <169719297092.17762.4738618306519344563.b4-ty@bootlin.com>
References: <20231002080529.2535610-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231002080529.2535610-1-u.kleine-koenig@pengutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


On Mon, 02 Oct 2023 10:05:17 +0200, Uwe Kleine-König wrote:
> the section mismatch check will get more strict soon. See
> https://lore.kernel.org/linux-kbuild/20230930165204.2478282-1-u.kleine-koenig@pengutronix.de
> for the details.
> 
> Several rtc drivers that use module_platform_driver_probe() trigger a
> warning with the above patch applied. Here they are marked with
> __refdata to prevent this warning from triggering.
> 
> [...]

Applied, thanks!

[01/12] rtc: imxdi: Soften dependencies for improved compile coverage
        commit: 2e2ad6393b430b643e607d49190e0b2628d5f035
[02/12] rtc: at91rm9200: Mark driver struct with __refdata to prevent section mismatch warning
        commit: 5dbde0727a515df85b1773a1f6dd301194c763f4
[03/12] rtc: imxdi: Mark driver struct with __refdata to prevent section mismatch warning
        commit: e6d44306e4fb476835fa7b818f0440c707b12844
[04/12] rtc: mv: Mark driver struct with __refdata to prevent section mismatch warning
        commit: 5621f28b0122861231057e3f452573a6e8d6a4c1
[05/12] rtc: pxa: Mark driver struct with __refdata to prevent section mismatch warning
        commit: 47712bc29401240cce89e631e04ba83891c976ee
[06/12] rtc: sh: Mark driver struct with __refdata to prevent section mismatch warning
        commit: 141626dbc2e69150fbd5bf241eba85790d7e95ab
[07/12] rtc: pcap: Drop no-op remove function
        commit: 94a2da3e6b681a970b248927bfb5d7d519bd3924
[08/12] rtc: at91rm9200: Convert to platform remove callback returning void
        commit: 48bc8830fbed98dff905fdbcaa424d59bb312043
[09/12] rtc: imxdi: Convert to platform remove callback returning void
        commit: 482ca730a4fc5fe766fb7d86c46c75b171d6efdf
[10/12] rtc: mv: Convert to platform remove callback returning void
        commit: ede66fb37f12737f96b2c1cbccae9c5ccf7be074
[11/12] rtc: pxa: Convert to platform remove callback returning void
        commit: e288cfe8f25f547a5359a72940e55b3e9a173bb1
[12/12] rtc: sh: Convert to platform remove callback returning void
        commit: f4d571b31b83127c2263fdf46eebf86f4d9991a2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

