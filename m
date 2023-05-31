Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02CC57174FE
	for <lists+linux-rtc@lfdr.de>; Wed, 31 May 2023 06:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjEaERF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 31 May 2023 00:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbjEaERE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 31 May 2023 00:17:04 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D603CBE;
        Tue, 30 May 2023 21:17:03 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2F9728164;
        Wed, 31 May 2023 04:17:03 +0000 (UTC)
Date:   Wed, 31 May 2023 07:17:01 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     linux-rtc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] rtc: rtc-twl: add NVRAM support
Message-ID: <20230531041701.GH14287@atomide.com>
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

* Ladislav Michl <oss-lists@triops.cz> [230413 12:56]:
> From: Ladislav Michl <ladis@linux-mips.org>
> Date: Sat, 28 May 2022 19:36:13 +0200
> 
> Export SRAM using nvmem.

Reviewed-by: Tony Lindgren <tony@atomide.com>
