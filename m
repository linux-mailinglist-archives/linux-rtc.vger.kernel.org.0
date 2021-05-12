Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7233937B48B
	for <lists+linux-rtc@lfdr.de>; Wed, 12 May 2021 05:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhELDdI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 May 2021 23:33:08 -0400
Received: from mail2.directv.syn-alias.com ([69.168.106.50]:44656 "EHLO
        mail.directv.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhELDdI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 11 May 2021 23:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha1; d=wildblue.net; s=20170921; c=relaxed/simple;
        q=dns/txt; i=@wildblue.net; t=1620790320;
        h=From:Subject:Date:To:MIME-Version:Content-Type;
        bh=WUG3OZfoJL5GgRQMneId4hT4nLU=;
        b=LUB1uLXbfo1cYMiDJ3sPT7dHnckNRmaAc4jHdUVDHJml0+qKkkCmHr3GIhsFOSAB
        lzlTfsrbId+nwJh2GQIiE3pFQ1+1YHoXJWAJy8IM8aQeh7GmmiHB7ZkFkC5f4JNU
        8l/lvn8QjxuHK0cixH28N2awR9XGOcmWPRYlxJxEzrdtNjcNQ7EOJsv4JT3hbZB8
        ULiClkr9ZATAid593cgFDxv71EnTF6Bc2DpMr5AORBgttHT+IWKKh7FZ+yLGlTfu
        aqo9beiG0F3oU7451NxRB/4VbFrwmfRDkVufhEJPjD9Nau1J3k4pRxdddrsDM9uh
        htx4xPR3VwyXe3S/zR8KZw==;
X-Authed-Username: c21pdGhncmluZGluZ0B3aWxkYmx1ZS5uZXQ=
Received: from [10.80.118.29] ([10.80.118.29:54466] helo=md07.jasper.bos.sync.lan)
        by mail2.directv.syn-alias.com (envelope-from <smithgrinding@wildblue.net>)
        (ecelerity 3.6.25.56547 r(Core:3.6.25.0)) with ESMTP
        id 8D/CD-02609-F2C4B906; Tue, 11 May 2021 23:32:00 -0400
Date:   Tue, 11 May 2021 23:31:59 -0400 (EDT)
From:   Rowell Hambrick <smithgrinding@wildblue.net>
Reply-To: rwhambrick92@gmail.com
To:     fanxuemei527@163.com
Message-ID: <36212914.90781495.1620790319765.JavaMail.zimbra@wildblue.net>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [89.46.103.172]
X-Mailer: Zimbra 8.7.6_GA_1776 (zclient/8.7.6_GA_1776)
Thread-Index: Bf+x5WSWrvToo5a2/xayK0xGbMxq4Q==
Thread-Topic: 
X-Vade-Verditct: clean
X-Vade-Analysis: gggruggvucftvghtrhhoucdtuddrgeduledrvdehuddgjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuufgjpfetvefqtfdpggfktefutefvpdfqfgfvnecuuegrihhlohhuthemuceftddunecugfhmphhthicushhusghjvggtthculddutddmnecujfgurhepfffhrhfvkffugggtgfhiofhtsehtjegttdertdejnecuhfhrohhmpeftohifvghllhcujfgrmhgsrhhitghkuceoshhmihhthhhgrhhinhguihhnghesfihilhgusghluhgvrdhnvghtqeenucggtffrrghtthgvrhhnpeeuhfelkedtteettedtveejveejffeikeejgfdtkeejkeeiudfhvdetgefgiedutdenucfkphepuddtrdektddruddukedrvdelpdekledrgeeirddutdefrddujedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtrdektddruddukedrvdelpdhhvghlohepmhgutdejrdhjrghsphgvrhdrsghoshdrshihnhgtrdhlrghnpdhmrghilhhfrhhomhepshhmihhthhhgrhhinhguihhnghesfihilhgusghluhgvrdhnvghtpdhrtghpthhtoheplhhiqhhirghnuddttddttdesuddviedrtghomhdphhhoshhtpehsmhhtphdrjhgrshhpvghrrdgsohhsrdhshihntgdrlhgrnhdpshhpfhepshhofhhtfhgrihhlpdgukhhimhep
X-Vade-Client: VIASAT
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Did you get my previous mail
