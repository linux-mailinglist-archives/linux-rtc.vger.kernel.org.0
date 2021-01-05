Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796A92EA6DE
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Jan 2021 10:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbhAEJER (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Jan 2021 04:04:17 -0500
Received: from mail2.directv.syn-alias.com ([69.168.106.50]:44947 "EHLO
        mail.directv.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbhAEJER (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Jan 2021 04:04:17 -0500
DKIM-Signature: v=1; a=rsa-sha1; d=wildblue.net; s=20170921; c=relaxed/simple;
        q=dns/txt; i=@wildblue.net; t=1609837415;
        h=From:Subject:Date:To:MIME-Version:Content-Type;
        bh=0wWFRklhGCwNmcwiM0NlDhYK3rc=;
        b=RS3zeIcCEmhb8FKh848RMdF3F45aY0etJUBDuXW4DeVmbs7VYOvjvvFA4MuuHPfK
        F5RGQPnyXfI596tc2e2+eSKcxxcPUzI4kc/jBFyaIjcc6UPKwBfRHoiZ8wn4Hqa5
        kEDCRRKNQ7FpEWBspKVAQNlibC229V8yiUpYYql+OVDVtSAEq6MtvvVnDtILEQ0B
        +hoWqclHFUS0CWDloyHdGoUQXfgJTsLwwiBlEWGnusyipM2Fj1hvGEXPMeGuuTvI
        +Lq31Plpzq3em+2k9hawRONLoask9bffFIzB+LDAuGkVbC+10NEcdnJYcFIxtR8+
        JfLMnRGnXN39/w8LvFrq7A==;
X_CMAE_Category: , ,
X-CNFS-Analysis: v=2.3 cv=a7tOCnaF c=1 sm=1 tr=0 cx=a_idp_x a=CtYk4amyIN86gY48oS+/5g==:117 a=9cW_t1CCXrUA:10 a=KGjhK52YXX0A:10 a=FKkrIqjQGGEA:10 a=pTz6eDbWlxwA:10 a=Ome6LeNZiNEA:10 a=IkcTkHD0fZMA:10 a=EmqxpYm9HcoA:10 a=0FMr-s9UgaIA:10 a=25oUfEzRQMIA:10 a=x7bEGLp0ZPQA:10 a=iRUk6Lete0CG9YA07IAA:9 a=QEXdDO2ut3YA:10 a=xo5jKAKm-U-Zyk2_beg_:22 a=9afDMuuuZj7VoIJXVRjH:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-CM-Score: 0
X-Scanned-by: Cloudmark Authority Engine
X-Authed-Username: bWlkZGxlY3JlZWtAd2lsZGJsdWUubmV0
Received: from [10.80.118.16] ([10.80.118.16:33710] helo=md01.jasper.bos.sync.lan)
        by mail2.directv.syn-alias.com (envelope-from <middlecreek@wildblue.net>)
        (ecelerity 3.6.25.56547 r(Core:3.6.25.0)) with ESMTP
        id 4A/0A-05577-66B24FF5; Tue, 05 Jan 2021 04:03:35 -0500
Date:   Tue, 5 Jan 2021 04:03:34 -0500 (EST)
From:   Rowell Habrick <middlecreek@wildblue.net>
Reply-To: rowellhabrick@gmail.com
Message-ID: <1610419030.152253640.1609837414758.JavaMail.zimbra@wildblue.net>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.201.33.41]
X-Mailer: Zimbra 8.7.6_GA_1776 (zclient/8.7.6_GA_1776)
Thread-Index: k+sbSq+spXdJYx57hEsF6eWgsFyhiw==
Thread-Topic: 
X-Vade-Verditct: spam:high
X-Vade-Analysis: gggruggvucftvghtrhhoucdtuddrgedujedrvdefgedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfujgfpteevqfftnfgvrghrnhhinhhgpdggkfetufetvfdpqfgfvfenuceurghilhhouhhtmecufedtudenucgohfhorhgsihguuggvnhfjughrucdlhedttddmnecujfgurhepfffhrhfkufggtgfgihfothesthejtgdtredtjeenucfhrhhomheptfhofigvlhhlucfjrggsrhhitghkuceomhhiuggulhgvtghrvggvkhesfihilhgusghluhgvrdhnvghtqeenucggtffrrghtthgvrhhnpeekhedtgeejieekgedvteelffevffejjedvkeeufedvieeklefftefguddvgfelteenucfkphepuddtrdektddruddukedrudeipdeijedrvddtuddrfeefrdegudenucfhohhrsghiugguvghnjfgurhepfffhrhfkufggtgfgihfothesthejtgdtredtjeenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehinhgvthepuddtrdektddruddukedrudeinedpmhgrihhlfhhrohhmpehmihguughlvggtrhgvvghkseifihhluggslhhuvgdrnhgvthenpdhrtghpthhtoheplhhiphhinhhghhhurgejudekseduieefrdgtohhmne
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Did you get my previous mail 
