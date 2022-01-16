Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A67A48FF93
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Jan 2022 23:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbiAPW7X (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 16 Jan 2022 17:59:23 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:56453 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233896AbiAPW7X (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 16 Jan 2022 17:59:23 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4D5C0200002;
        Sun, 16 Jan 2022 22:59:19 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH rtc-tools] .gitignore: Add an entry for rtc-range
Date:   Sun, 16 Jan 2022 23:59:17 +0100
Message-Id: <164237395201.3520206.5517796351734891121.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203190324.1514671-1-festevam@gmail.com>
References: <20211203190324.1514671-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 3 Dec 2021 16:03:24 -0300, Fabio Estevam wrote:
> The rtc-range binary should also be ignored by git.
> 
> Add an entry for it.
> 
> 

Applied, thanks!

[1/1] .gitignore: Add an entry for rtc-range
      commit: acc442e7af4e1e783432a43d37f1a7938c692659

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
