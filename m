Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7F9E6490DA
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Dec 2022 22:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiLJViq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 10 Dec 2022 16:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLJVio (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 10 Dec 2022 16:38:44 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56A813DC5
        for <linux-rtc@vger.kernel.org>; Sat, 10 Dec 2022 13:38:43 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D34C760003;
        Sat, 10 Dec 2022 21:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1670708322;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R320RWEiCZwg6H1KDxv4QHqIdEho1W3k7eteFaGSq0g=;
        b=GXr+k3i+tjviqcuu+IvGfTxl+5tOgcxUhjZA8ho6jKrW0IkQ3yQIE5QUyo+hJtkVFJCxXz
        Z5DhhW5g1PF7fG7sWyVPTEkKZcNuWHxXVGlk0p141DFwI95L4QBpnQWM/hbYtx7BrySg20
        Uv4nNTB4mmx12Im2qwtwsR7Wyo4YwwFH19Z219sMjxk6ikVLboan2CAxLnKAucGn+Axazp
        h9nefkY7BaW6i72jeY9XXoffOUzoptHQwci1TicPr6MsMem8F0Iw4aWMwABihcJy7ooRUv
        2daghl7ke4Ooqs2KYIoc1bwTgB7Zbr2l0so6vlI8Cp6WE6sb3FXF9wI3piT9sQ==
Date:   Sat, 10 Dec 2022 22:38:41 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>,
        patrice.chotard@foss.st.com, a.zummo@towertech.it,
        lee.jones@linaro.org
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] rtc: st-lpc: Add missing clk_disable_unprepare in
 st_rtc_probe()
Message-ID: <167070826404.276368.13396623820724610984.b4-ty@bootlin.com>
References: <20221123014805.1993052-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123014805.1993052-1-cuigaosheng1@huawei.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 23 Nov 2022 09:48:05 +0800, Gaosheng Cui wrote:
> The clk_disable_unprepare() should be called in the error handling
> of clk_get_rate(), fix it.
> 
> 

Applied, thanks!

[1/1] rtc: st-lpc: Add missing clk_disable_unprepare in st_rtc_probe()
      commit: 5fb733d7bd6949e90028efdce8bd528c6ab7cf1e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
