Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 068BC52AD61
	for <lists+linux-rtc@lfdr.de>; Tue, 17 May 2022 23:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245102AbiEQVNL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 May 2022 17:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242972AbiEQVNK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 May 2022 17:13:10 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B1742EEA;
        Tue, 17 May 2022 14:13:08 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A0AAEC0002;
        Tue, 17 May 2022 21:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652821987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qBaJl8WcrskpVvu5x6uJ7XKJuPc6WqxXWNmf+zmU5C0=;
        b=XJcefgUihW/mLjSlmZtAH14YAmr+OzwTF9nzTT5peXEn5qhJwOG7F8ludFkaVHvWachzQE
        Dge4lHwLx7J+sd78ampwrHRodU5qkixX6wbHznUf+cCDE9RRCbCTdUcV/GQMWfpyWBZFjQ
        1Vku6mgH/GCStsAJ8vd8RZHIYA4J0TTVCXkvMeeGDFTY1b6/cI5FRgQHaZNp2TXMwKKf5f
        bYl336+RgOZquuSf+B97QxDHxMC49f4COEgh2CU3yhXNA9JfFFLoajmVKd77zBCoQO4k1V
        jnSIOAgt8YZhrLYXNTBadCC/ssPZKuo3ymniggDSCC7cnstMdcQUrSDSvtgpLw==
Date:   Tue, 17 May 2022 23:13:05 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Herve Codina <herve.codina@bootlin.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Pascal Eberhard <pascal.eberhard@se.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Jimmy Lalande <jimmy.lalande@se.com>
Subject: Re: [PATCH v7 0/5] RZ/N1 RTC support
Message-ID: <165282193419.289847.12458884088861451958.b4-ty@bootlin.com>
References: <20220516082504.33913-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516082504.33913-1-miquel.raynal@bootlin.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 16 May 2022 10:24:59 +0200, Miquel Raynal wrote:
> This small series adds support for the RZ/N1 RTC.
> 
> Despite its limitations, I found useful to at least have alarm and
> offset support.
> 
> Cheers,
> Miquèl
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: rtc: rzn1: Describe the RZN1 RTC
      commit: 4c4d145a65e5a7faac440081bc1eac860930cd24
[2/5] rtc: rzn1: Add new RTC driver
      commit: deeb4b5393e106b990607df06261fba0ebb7ebde
[3/5] rtc: rzn1: Add alarm support
      commit: b5ad1bf00d2c4bf96bf9318f44a929f0b22dd29c
[4/5] rtc: rzn1: Add oscillator offset support
      commit: be4a11cf98aff5d456eae947a49b6163393d9420
[5/5] MAINTAINERS: Add myself as maintainer of the RZN1 RTC driver
      commit: 060eceb739e5b30db684666592c2a33d09426651

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
