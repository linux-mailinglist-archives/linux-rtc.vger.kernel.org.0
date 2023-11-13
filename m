Return-Path: <linux-rtc+bounces-300-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD3D7EA619
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Nov 2023 23:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D61211F22A79
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Nov 2023 22:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125D53B7A8;
	Mon, 13 Nov 2023 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="izQsON3R"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B53C08D
	for <linux-rtc@vger.kernel.org>; Mon, 13 Nov 2023 22:38:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E4410D0;
	Mon, 13 Nov 2023 14:38:20 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46A21E0003;
	Mon, 13 Nov 2023 22:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699915099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3sTxLeLc82mmht8wipjypAj1ei1WrsDVW9xRtHUoNb8=;
	b=izQsON3R8/VUAZyRk+epXwsiLweP3Bpw71vvAYojUMF3F7jTw+Ky2q1kibsrT8uREh2CEk
	gVavslBD7SoTts5jS/kypeEcwb+nuPXhK/Ydj2MuRUpHM09jY5AFkPTUfWj/rk+7g8e89U
	Wo1M656A9vWP1z6snHrS8ttrdFx/4P6nZ/vMClnsA0cTaOdUFFXslhdJddrTRR4RND/OeZ
	LwfiID/v+I8Mg6LBj+LzyiO/uONGY30AoGALF36JFGikMP1NDJ8nj+94dNZvxs2P1hZQX4
	KuNrBF5MbbeORLBekO7SXGLuyFTacxgsIwER/7OkqGdwv7sa5Y9o4G2Da3nuIw==
Date: Mon, 13 Nov 2023 23:38:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, alvin.zhuge@gmail.com,
	renzhamin@gmail.com, kelvie@kelvie.ca,
	Raul Rangel <rrangel@google.com>
Subject: Re: [PATCH] rtc: cmos: Use ACPI alarm for non-Intel x86 systems too
Message-ID: <20231113223819fb469198@mail.local>
References: <20231106162310.85711-1-mario.limonciello@amd.com>
 <CAHQZ30DP8ED4g3bib-tZ53rm2q2_ouEEL3TxD-SgK4YrCe3bew@mail.gmail.com>
 <d55a80f7-ca4d-406f-b2c8-b2bba45e3104@amd.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d55a80f7-ca4d-406f-b2c8-b2bba45e3104@amd.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 13/11/2023 15:36:28-0600, Mario Limonciello wrote:
> Now that the merge window is over, can this be picked up?
> 

I'd be happy to invoice AMD so they get a quick response time.

> All of those people who reported it have also reported on the matching
> trackers that it helped their issue.
> 
> Thanks!

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

