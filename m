Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0C93542A1
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 16:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237452AbhDEOOM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 10:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241261AbhDEOOM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 10:14:12 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BDFC061756
        for <linux-rtc@vger.kernel.org>; Mon,  5 Apr 2021 07:14:06 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c3so11567062qkc.5
        for <linux-rtc@vger.kernel.org>; Mon, 05 Apr 2021 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UGAZDvikM3ntGj44hKL9ZLq+2otHE3NaBFg6ddjcMJY=;
        b=LUqal+0ERi39JA7rpR3tVI7RKIcDLp1VJ03QZp4Li2cbz8QK4gJqqz2RuWYKBk0UXI
         xkWO5GEvCucmPjfISmM7ZbFJHKxHHA4CKHtceuxLEVd/N66IbqdgyPHGTzhDG9DiXbYB
         ljfHdgt/wAd3hrBb047hXQ8asayZvag7vQtoDR18Al7Fa2bbT/M+Sy8UsVZivs5n04M7
         gHgiFsmPf2owscIZHK65USCNcjAVaZ3P9OeJFwcm5fyynAe1nl0p//ErqKpqqMCoTPTd
         Kfk7433/VZftYGwuyx2gxrVV7iVkQXoW91Rv3MU2/mkw6HnDMNC/imOerpOLGBWxOZZ+
         5K7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UGAZDvikM3ntGj44hKL9ZLq+2otHE3NaBFg6ddjcMJY=;
        b=SIpToi4rcUHIflCVrwXEqz7qqHYSTi4ISaYI8xUMcUvihxZx1Dy5A7AeXy/CDwGu/s
         4t5OS3SqmkIhAbqfAo4CE9sOfbaycYI8yx5F5u/5p/6PPe2VK4QPD5sfiJe3EcHF/IvV
         YXc5K71Ek7AhWla0WMR6GZOtjXFLrJdzbnJk8UMBPnJ5guzET8vkYjKbEitJ9hZXs803
         2bWL707/OhH6CY0TbnPxw71LjDx3JOUtesgaMlA+ACbiykuBRWgoYngyp+6pe76Wv0qd
         vIQaSEHG5L4eVZRB48H2mz5TLJcgWrMBcxmQQe0vIWB30YontU6FEUjaf/2dVmk7h+Ya
         cSvQ==
X-Gm-Message-State: AOAM530whBKVTSb4ylpg/R2q0nJzauWAPo9XPloF2nteTmH24kWPvszE
        p53IGV7kMKut5ZBhAoVt0BM=
X-Google-Smtp-Source: ABdhPJwAU5AfAFh6oF+2GSE0iBhDZWJp7D7e5DoDFsdex4HTay8hRfHEzb+FXLKtOUHUYSsKPv/1/Q==
X-Received: by 2002:a37:a785:: with SMTP id q127mr23885424qke.425.1617632045722;
        Mon, 05 Apr 2021 07:14:05 -0700 (PDT)
Received: from shaak.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id h14sm11970633qtx.64.2021.04.05.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:14:05 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     liambeguin@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, panfilov.artyom@gmail.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v1 0/4] add alarm support for the rtc-ab-eoz9
Date:   Mon,  5 Apr 2021 10:13:30 -0400
Message-Id: <20210405141334.3884528-1-liambeguin@gmail.com>
X-Mailer: git-send-email 2.30.1.489.g328c10930387
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

Add alarm support for the rtc-ab-eoz9.

The board used to test this series has the interrupt line of the RTC
connected to a circuit controlling the power of the board.

An event on the interrupt line while the board is off will power it on.
Because of these hardware limitations, the irq handler added in this
patch wasn't fully tested.

The alarm functionality was tested, with:

	$ date "2010-10-10 10:10"
	Sun Oct 10 10:10:00 UTC 2010
	$ /usr/sbin/rtcwake -u -d /dev/rtc0  -s20 --mode off
	[ ... ]
	$ # power on after 20 seconds


Liam Beguin (4):
  rtc: ab-eoz9: make use of regmap local variable
  rtc: ab-eoz9: set regmap max_register
  rtc: ab-eoz9: add alarm support
  rtc: ab-eoz9: make use of RTC_FEATURE_ALARM

 drivers/rtc/rtc-ab-eoz9.c | 149 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 141 insertions(+), 8 deletions(-)


base-commit: e49d033bddf5b565044e2abe4241353959bc9120
-- 
2.30.1.489.g328c10930387

