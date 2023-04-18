Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 120366E5DBC
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Apr 2023 11:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjDRJnp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 18 Apr 2023 05:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbjDRJnR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 18 Apr 2023 05:43:17 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A1E2F6EAF;
        Tue, 18 Apr 2023 02:43:05 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F3E4B8106;
        Tue, 18 Apr 2023 09:43:04 +0000 (UTC)
Date:   Tue, 18 Apr 2023 12:43:03 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     linux-rtc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] rtc: rtc-twl: add NVRAM support
Message-ID: <20230418094303.GB14287@atomide.com>
References: <ZDf7qZTiml0ijD2g@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDf7qZTiml0ijD2g@lenoch>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

* Ladislav Michl <oss-lists@triops.cz> [230413 12:56]:
> Export SRAM using nvmem.

Patch looks good to me, just wondering how this is used..

Are we just exporting the nvram via sysfs for userspace to use it
for whatever, or is there also some RTC core layer use for it?

Regards,

Tony
