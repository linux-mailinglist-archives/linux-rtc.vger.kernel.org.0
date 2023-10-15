Return-Path: <linux-rtc+bounces-96-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D67C9BB1
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 23:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EEFB1C208BA
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Oct 2023 21:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC1611CBD;
	Sun, 15 Oct 2023 21:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="djihpRT8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BEBF9D7
	for <linux-rtc@vger.kernel.org>; Sun, 15 Oct 2023 21:02:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFD9B7;
	Sun, 15 Oct 2023 14:02:54 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03FF51BF203;
	Sun, 15 Oct 2023 21:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697403773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y+OVMmYlFPzuUi7xiFYuWXvjmH0z07SQ3F3rVS2El4=;
	b=djihpRT8NL5vB9Qo5i4K6Qfw0aYNGcyymKRwfQUDJ+etW7Kir+tKiAuBkTf1wLJDl4DUR9
	pxNnYYWyuRAykXtTij0V6dXYXswSIRfOsJ0XJFr+I1ac86ekKZa3RDPK6F2z4aGZwvtkm9
	xDl2+t5950mZD276g1LcGR+s2CaoHNZUJxyaFmL0o/O/PAGNh4T21dwPB9EGtOuL9cHwKq
	1nT+XzMufPn+v4hTQov7ekPH4kbRsclyfG5ogDBhKMGpNQuSckz5n+z+O01zESn0YvmZEG
	KAS596+Iqr4k3KCOMgAOnwpI0joV3WEDJgQO04YlPC4NnzoLEr4IOmtll89+dg==
Date: Sun, 15 Oct 2023 23:02:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf85363: fix wrong mask/val parameters in
 regmap_update_bits call
Message-ID: <169740375017.169509.12472808728728079735.b4-ty@bootlin.com>
References: <20231013-topic-pcf85363_regmap_update_bits-v1-1-c454f016f71f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013-topic-pcf85363_regmap_update_bits-v1-1-c454f016f71f@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


On Fri, 13 Oct 2023 16:34:21 +0200, Javier Carrasco wrote:
> The current implementation passes PIN_IO_INTA_OUT (2) as a mask and
> PIN_IO_INTAPM (GENMASK(1, 0)) as a value.
> Swap the variables to assign mask and value the right way.
> 
> This error was first introduced with the alarm support. For better or
> worse it worked as expected because 0x02 was applied as a mask to 0x03,
> resulting 0x02 anyway. This will of course not work for any other value.
> 
> [...]

Applied, thanks!

[1/1] rtc: pcf85363: fix wrong mask/val parameters in regmap_update_bits call
      commit: 2be36c09b6b07306be33519e1aa70d2e2a2161bb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

