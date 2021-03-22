Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149F534380A
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Mar 2021 05:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhCVEtx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Mar 2021 00:49:53 -0400
Received: from mail2.directv.syn-alias.com ([69.168.106.50]:43609 "EHLO
        mail.directv.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbhCVEt1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Mar 2021 00:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha1; d=wildblue.net; s=20170921; c=relaxed/simple;
        q=dns/txt; i=@wildblue.net; t=1616388567;
        h=From:Subject:Date:To:MIME-Version:Content-Type;
        bh=+/gMcM2JLBRroFSmmYDV09lAd+8=;
        b=VbuVXeNEs9duyDwuV+pgWktjgHk49xxc0KzDwFdLxXDWBgr+ehwxu2As/wau9eXc
        KCYGbpT6twXCbMCsLRdNLky2J0IMT7I2qwk0Ko6y9qNCVWep/CZiLfXLEKsCPRVx
        hGnGXa2BvFobkozXBrVxZhGIJzutTRiBSp1SSxDTNs9HA6jdgz5PBq/ksIXTfrD5
        qeP91yfeI3ao+4yD/shW2yjGmpiU4Z4igyp71Sz1+xSP3RnOn4SE8oJmxpxG+kXC
        b7yfFCINvk33I6k/hGRMLuSoTfJ7F1E22v+lXfajEhmkIq2dYqqIkk+CnV64I2Ci
        5yFi4nco7t0k7zOeQxAVLQ==;
X-Authed-Username: am9iZWFyQHdpbGRibHVlLm5ldA==
Received: from [10.80.118.6] ([10.80.118.6:57130] helo=md05.jasper.bos.sync.lan)
        by mail2.directv.syn-alias.com (envelope-from <jobear@wildblue.net>)
        (ecelerity 3.6.25.56547 r(Core:3.6.25.0)) with ESMTP
        id 84/F0-06922-6D128506; Mon, 22 Mar 2021 00:49:26 -0400
Date:   Mon, 22 Mar 2021 00:49:26 -0400 (EDT)
From:   Rowell Hambrick <jobear@wildblue.net>
Reply-To: rowellhabrick@gmail.com
To:     cswog-rtog@foxmail.com
Message-ID: <1855551633.41146672.1616388566327.JavaMail.zimbra@wildblue.net>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [91.132.136.92]
X-Mailer: Zimbra 8.7.6_GA_1776 (zclient/8.7.6_GA_1776)
Thread-Index: f76gJpOZJWqxzehT/rj2gTNMtVw4XA==
Thread-Topic: 
X-Vade-Verditct: clean
X-Vade-Analysis: gggruggvucftvghtrhhoucdtuddrgeduledrudegfedgjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuufgjpfetvefqtfdpggfktefutefvpdfqfgfvnecuuegrihhlohhuthemuceftddunecugfhmphhthicushhusghjvggtthculddutddmnecujfgurhepfffhrhfvkffugggtgfhiofhtsehtjegttdertdejnecuhfhrohhmpeftohifvghllhcujfgrmhgsrhhitghkuceojhhosggvrghrseifihhluggslhhuvgdrnhgvtheqnecuggftrfgrthhtvghrnhepuefhueetledtuefhffdvgefhfeehveeufedufffhleeljeeiffekvdekfeetheeunecukfhppedutddrkedtrdduudekrdeipdeluddrudefvddrudefiedrledvnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehinhgvthepuddtrdektddruddukedrieenpdhmrghilhhfrhhomhepjhhosggvrghrseifihhluggslhhuvgdrnhgvthenpdhrtghpthhtohepnfhiphhinhhglhhiuhgphhhpshesudeifedrtghomhen
X-Vade-Client: VIASAT
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Do you get my last mail
