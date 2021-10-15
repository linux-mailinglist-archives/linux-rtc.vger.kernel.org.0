Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2053A42FBE6
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 21:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242649AbhJOTXd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 15:23:33 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50311 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhJOTXd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 15:23:33 -0400
X-Greylist: delayed 540 seconds by postgrey-1.27 at vger.kernel.org; Fri, 15 Oct 2021 15:23:33 EDT
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5A1E5FF802;
        Fri, 15 Oct 2021 19:21:25 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 0/7] rtc: add new ioctl interface and BSM support
Date:   Fri, 15 Oct 2021 21:21:13 +0200
Message-Id: <20211015192121.817642-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This adds a new ioctl interface allowing to get and set extended
parameters on RTCs. While its main goal is to support backup switch
mode, it also intends to fix a long time issue. Until now, it was not
possible to know what features were supported by an RTC before actually
trying to make use of it and see that succeed or fail. In order to make
tests more reliable and allow userspace to take the correct decision,
the features are now exposed.

Alexandre Belloni (7):
  rtc: add alarm related features
  rtc: add parameter ioctl
  rtc: expose correction feature
  rtc: add correction parameter
  rtc: add BSM parameter
  rtc: rv3028: add BSM support
  rtc: rv3032: allow setting BSM

 drivers/rtc/class.c      |  3 ++
 drivers/rtc/dev.c        | 65 +++++++++++++++++++++++++++++++++
 drivers/rtc/rtc-rv3028.c | 73 +++++++++++++++++++++++++++++++++++++
 drivers/rtc/rtc-rv3032.c | 78 ++++++++++++++++++++++++++++++++++++++++
 include/linux/rtc.h      |  2 ++
 include/uapi/linux/rtc.h | 33 +++++++++++++++--
 6 files changed, 252 insertions(+), 2 deletions(-)

-- 
2.31.1

