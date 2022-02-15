Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFFB4B73D3
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Feb 2022 17:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237375AbiBOQmb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Feb 2022 11:42:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233493AbiBOQmb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Feb 2022 11:42:31 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B8DC9A12
        for <linux-rtc@vger.kernel.org>; Tue, 15 Feb 2022 08:42:20 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8AF271BF207;
        Tue, 15 Feb 2022 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1644943339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8jxqJ6ynaYcj1XtoQpd/F+Q+X3NlGMNKvd/f5b2N+oY=;
        b=mt6yO5J3E7YM44ByHNcREpTrtIbppaAZGjBnO0LwER+V+2pYuryWGprNp7g0jHj/erKTCV
        oAuNTPUMA3z13Za6acttXar6YhUR6ju2ph8LMpD6yM7fKuuiJnov7ardnspYxMIQdNkv+B
        631wRounQfLqFiJFEE5ClI66hOuOxmFPKLqQKbDmD0304chjFu4VD9sgI1PVj2tWiLj0Pl
        dlvOLHMIB8GBFqeHx4EOZ4ksr5pnKLyxJvS1c6JxFPynKHLxYxIrsX6xtIkeFc1P5hKTcs
        3lFbdWQ7PKbNHonFe0FwLbACrLHLwzU0j+1IdceQRiBL7gCll9tF3y9CJrHbgQ==
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
        peter.kjellerstedt@axis.com
Subject: Re: [PATCH rtc-tools v2] rtc-tools: Add a Makefile
Date:   Tue, 15 Feb 2022 17:42:18 +0100
Message-Id: <164494332651.33437.18174969065557227356.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220127225928.34214-1-festevam@gmail.com>
References: <20220127225928.34214-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 27 Jan 2022 19:59:28 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Add a Makefile to make installation and uninstallation
> process easier.
> 
> 

Applied, thanks!

[1/1] rtc-tools: Add a Makefile
      commit: 61839777afedcc7bdb68ea4628c5ce5ca72c2ac8

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
