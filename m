Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB9F33CED6
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 08:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbhCPHuB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 03:50:01 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43495 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbhCPHtk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Mar 2021 03:49:40 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6D155FF811;
        Tue, 16 Mar 2021 07:49:38 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: mxc: Remove unneeded of_match_ptr()
Date:   Tue, 16 Mar 2021 08:49:37 +0100
Message-Id: <161588092513.637717.7389096109095766465.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210315235800.200137-1-festevam@gmail.com>
References: <20210315235800.200137-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 15 Mar 2021 20:58:00 -0300, Fabio Estevam wrote:
> i.MX is a DT-only platform, so of_match_ptr() can be safely
> removed.
> 
> Remove the unneeded of_match_ptr().

Applied, thanks!

[1/1] rtc: mxc: Remove unneeded of_match_ptr()
      commit: 9346ff0bc6ff3c3a495d50a43b57df8fed7bc562

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
