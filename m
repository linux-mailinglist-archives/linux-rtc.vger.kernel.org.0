Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6715F8B90
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Oct 2022 15:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiJINZ0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 9 Oct 2022 09:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiJINZZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 9 Oct 2022 09:25:25 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B311827CD4
        for <linux-rtc@vger.kernel.org>; Sun,  9 Oct 2022 06:25:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j4so13312422lfk.0
        for <linux-rtc@vger.kernel.org>; Sun, 09 Oct 2022 06:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmuVHgQTGSW4pBgLHyr3r3J1G7KlM6k/vY2ryTt9UVA=;
        b=MStoIUt/jkAeNDm6p1cp0a/3nEGsw0ABoSxmE78Y9R9oN9ll1ANsueG1/zDPWWjx12
         suxVDHDI0Zd9VpqtxeboGKuGrA25l2QVdNsehzDfUFpNLkSiVDxMTZBZRcRWo2c/c8Rf
         0Y0DQVwc9iYjZpbzRpAKZXCXPnok63G0tNbfSMJWo69XDFD0Pd8HrvzEJ08hQYc/nizs
         Ix4vk/lkL0IWAus/cu/YS21qRNUAO3oufSKUB46srYGidNLMK8Hcj7RSNDcGP+MD1UMp
         E08TbcCwyfEdiCC1aWK2PhK07tVUzLSPhZB6QiQ/qtbATxGQ4Eg7z5V/JkOknoc17cSn
         q7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmuVHgQTGSW4pBgLHyr3r3J1G7KlM6k/vY2ryTt9UVA=;
        b=1t4QW3JSo1yqZLAMFdTg8ypxPCjK3LW9oiDv9YF0IJo1GwNzpEvL4fwz4eaP1PID0E
         jlPGLoZfuMCsfMCiy1QIH7bySWFge7nEdghf+LwylML2zBchivi8giVNsXALmg4Qngu/
         w7d3R1NcVANHRgeW/8nKrXQmRjkAryk67udGVze2bsDR9a4DddJ2iKD9ZLIqljoXYSo/
         S3xYm/KDlBp1AWNMdCKw5KmFhNQTQCe+BU43qr1xqCfynzf1cmMrFosvFZPeql9e8oTw
         yspxoVCgs+3NGxAnRnekR0iUEMsVtw2dwW7dQEhLWuSXCfabcWuTRn/9gZHlRJgt7X8R
         feKA==
X-Gm-Message-State: ACrzQf2JGxugqE0XB07DPBENzpDV5yMbJUinxgCEBB/qX3UcP/7Bq18h
        iDBGbD0h/fgPaMDh94ePW0U1OxxjzyHjaVly2MI=
X-Google-Smtp-Source: AMsMyM42RjUXm+ta0oLPu7CIzcsmWNtipqkyX6LX/YC0kaOQ1NW8TS6S35UNkvhUg4UAbQz++7wuxcocqzbRU+l4Mr0=
X-Received: by 2002:ac2:558b:0:b0:4a2:2706:43f6 with SMTP id
 v11-20020ac2558b000000b004a2270643f6mr4683256lfg.601.1665321922692; Sun, 09
 Oct 2022 06:25:22 -0700 (PDT)
MIME-Version: 1.0
Reply-To: dr.zeida.chedsworth1@gmail.com
Sender: chinedu00226@gmail.com
Received: by 2002:a05:6520:250d:b0:220:4965:c76b with HTTP; Sun, 9 Oct 2022
 06:25:22 -0700 (PDT)
From:   Dr Zeida Chedsworth <dr.zeida.chedsworth1@gmail.com>
Date:   Sun, 9 Oct 2022 06:25:22 -0700
X-Google-Sender-Auth: nsqo-WzkgiSaPLgrOgAyZpDHM2M
Message-ID: <CAO_JxW8RHhGTJkxk5qu_dtJ3qZTOjmjdCL4JQ0J0r+-tHReQ7Q@mail.gmail.com>
Subject: URGENT RESPONSE NEEDED
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_MONEY,URG_BIZ autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8353]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dr.zeida.chedsworth1[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [chinedu00226[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [dr.zeida.chedsworth1[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:129 listed in]
        [list.dnswl.org]
        *  0.6 URG_BIZ Contains urgent matter
        *  2.4 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Good Friend,

I have a client who has indicated interest in investing overseas. He
also intends to partner with anyone with a good knowledge of business
in the country of the investment who shall act as the Managing partner
as he may not be able to relocate out of his country at the moment to
manage the business because he holds a political appointment with the
government. Please, if you're interested, reply for further
discussions. Contact the director here for more explanation Regards
Management,

Dr Zeida Chedsworth,
