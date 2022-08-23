Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8149359ED66
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Aug 2022 22:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiHWUgf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Aug 2022 16:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiHWUgU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Aug 2022 16:36:20 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00AC193E0
        for <linux-rtc@vger.kernel.org>; Tue, 23 Aug 2022 13:18:17 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 0FD7C1C0004;
        Tue, 23 Aug 2022 20:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1661285894;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9B6+j9Wpz4wITokgTDAciVB/+GFTYbq7sWjUZXhdEg8=;
        b=Bh00Bo+4ByR1y/WESK50MpFfoZtFJnsud2qe/taHGiSqf0taEj3K0LIgtmlWIF8oSeXYkh
        p89MA5Ueie09sDmz+2MOEkkvqrfvZqJylc6gM/YkaypB5hoNaI8C5lB2A61pZBin2oMu/D
        bgn/OYzfS8IShO8JZ9Vi+8xEr0wPaLGF0RXT6o8mY2TLifiDFKbVh81IIWFg6E2xox0b+X
        I4eNhXXV00pM04KewBZLX6q5dMFpWlyh1R+5y+TgZcpwAIh8Hceh6TLlSoXTLq4+S+O4Dv
        12RbDAD7O60cl6R4QH73bu7Sq47qHsJWxq9mJVmGmXhmCYeIvfIoTzwSiE2fsw==
Date:   Tue, 23 Aug 2022 22:18:13 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     conor.dooley@microchip.com, daire.mcnamara@microchip.com,
        a.zummo@towertech.it, geert+renesas@glider.be
Cc:     linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] rtc: mpfs: Remove printing of stray CR
Message-ID: <166128585619.2840885.5274671308579243646.b4-ty@bootlin.com>
References: <bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 16 Aug 2022 16:18:25 +0200, Geert Uytterhoeven wrote:
> During boot, the driver prints out a stray carriage return character.
> Remove it, together with the preceding space character.
> 
> While at it, change prescaler to "unsigned long", as returned by
> clk_get_rate(), to avoid truncating very large clock rates, and update
> the format specifiers.
> 
> [...]

Applied, thanks!

[1/1] rtc: mpfs: Remove printing of stray CR
      commit: 07ae9278b423500f93e10869b1a50276d82050ec

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
