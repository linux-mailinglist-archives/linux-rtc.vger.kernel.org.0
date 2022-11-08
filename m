Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 269D46216B9
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Nov 2022 15:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234295AbiKHObw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Nov 2022 09:31:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbiKHObF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Nov 2022 09:31:05 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E83CDFD2D
        for <linux-rtc@vger.kernel.org>; Tue,  8 Nov 2022 06:31:04 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id m6so13997992pfb.0
        for <linux-rtc@vger.kernel.org>; Tue, 08 Nov 2022 06:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=plCZMl07mNxOy4FwEnJyPWecERqsJQyrHYHIsHPByWrtU1k24II845ABLvzsZ/utuV
         xrfZ6D/e/ZRoyRjpbZ5oMDY9h9ndbu6gtWFiQs/CjHcVVSqci/vjYPMMyy1pnVJ69u5N
         OM2Kwkcs/9db1KNzWi4t4Kki8xmdjDy37F969+9phg4q7Iutyq/zyteGqROU9T6wdO4n
         lS/c2RFkn8H1h3UlswE5jNY6oMt5wQG8oq965L41J8fDh6fe1zek7KZifUk151Do70De
         k9oKwcRkEhDvguAg4zcTYagV5rrGsvTLwyNtdWlzI5EY/CPrjAga8S7nNTzf3DHImH9S
         a/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=uZZaCq70oaeA2u9GCm5We8SxCR0eWJq49jP9C2yYRzmI9ULr/nGpkT95SJZB7g1ugH
         s42SWiP2B4zaAIl7FauHZgfWh+WMagsjoJI+NmIwfwkMPaX/t8EX2AaCrid+OXJRze7h
         RKtCYO1R1SAeEjFTbcsyK9SWpzFt0qhR5Z7mygHJaSKCOoCz5tSr2MBpFter56u9WVJO
         xzovubAIiWc8NGVmzBUEtIGWmFeKLzvKEP+Wf33VLqDli5LpAjgEOqblRhJBQpwLzKRT
         LM5B6L3KzUI7IZMJy7lvKSZjy773lXAOeBTj9cBBFVykQFS96ChJ/GbT1Pz8GbhHm7fi
         J2Yw==
X-Gm-Message-State: ACrzQf3lQm8AKAlmx1K5yqOfRjQyaR1U4TvWoPol8h1DnQOSYRFDN77J
        YWZhMt+KDstreJmr8rAOQOS7eYR3vJf9U3MhKWA=
X-Google-Smtp-Source: AMsMyM5cpw1VKvG8gEasOMmG4UhkblJY7gBReqfbYX80x9OXEWSZokzXOm90JDY4L5h3JbfU+3ckCU+QNWhG8SGrNVo=
X-Received: by 2002:a05:6a00:1da6:b0:56c:318a:f8ab with SMTP id
 z38-20020a056a001da600b0056c318af8abmr56843835pfw.82.1667917864342; Tue, 08
 Nov 2022 06:31:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac4:c8c2:0:b0:56a:d900:eb11 with HTTP; Tue, 8 Nov 2022
 06:31:03 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <davidbraddy01@gmail.com>
Date:   Tue, 8 Nov 2022 14:31:03 +0000
Message-ID: <CAHGOU4PvdrNhE2KifzdPkFxZTCG5gy+23qf130PwnSmJcLRSew@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:431 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4569]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidbraddy01[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidbraddy01[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
