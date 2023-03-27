Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4C5B6C9EBA
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Mar 2023 10:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233239AbjC0I6q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 Mar 2023 04:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232907AbjC0I6L (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 Mar 2023 04:58:11 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2105.outbound.protection.outlook.com [40.107.22.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E012127
        for <linux-rtc@vger.kernel.org>; Mon, 27 Mar 2023 01:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLAyIFOsrWTD4DBZj2ApnxXNph63iEgCbBWo/hWVVAqqeRNxj4wnggmRXa0e6QK+pSlNyM8kethrz1hQUwcjmFmRuDKv86JrnGXm4y3Yjnnp9aF9x7RQ32VZsbKqGWqCT6Jl6msEFAVTIexvGmkHHOHlaeaqslSKaGirjJOxC3J2s5+rRI0Dn9RHrPnRtBVlFU4j5Z1qRYu8qOz74eJEydsTHBCl7odNLvy6JtHugLszDKlSpFWp4CZamP8g05P07XWReBwQR3RZculaEGb6k/e2GesSlsjpVak7B/80Pp/F42VzKAuzXv8W/661su0fRqEQDu/UFqMlaNHf79xmDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UyEgs10w7HcIzE3VHU45t/Mdc8skFgRatFU1wfepWE=;
 b=aM+KJ4HAAL/L9GCVMFjd+Py93i2awVcAYeRtRFDMMw7Wc5+tY3kfqKa3WpmGQdwMhZ4cLEoMTUmQQWPVO/QBCNXO4TgNSc6hg+ZfgItK1XRzhF3Wr+YL4k26EORFYiZcHYJLIwrIkFsllSyBX/fj7h0fs6wYDCgJtCrpXqmiozUrUAM0bucWO8oK5H0cmb4ERZeUciebYbBzUFEeAP9xVY1PcA7JI9cqUDBYkgiYrfVOeTVbjkgms3Ew9JJo87P43MWkH2SLTrhhkNZlzCKUsipsU5wFYE8eNjfwK2bnjQmWKqAQi0KVqNmSKhoxoPgEQqKi80SZTwrEMDG7JhB7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sigmatek.at; dmarc=pass action=none header.from=sigmatek.at;
 dkim=pass header.d=sigmatek.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigmatek.at;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UyEgs10w7HcIzE3VHU45t/Mdc8skFgRatFU1wfepWE=;
 b=L1lIYf/9JxNaZhiRNMsSSAJWqwHCyxgK6w9h2BSe+40QQ0lNNGyGaIxGA7jVEduEvie+g4mKtwhB+b1JbQp3Eh/NSp6XgI234/5fMO7wgftvY7iQRUByHyEfZkrpwbCdjig1fqucJbM1186mPShu2qwi6jnbm/RchuEaqwaTAhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sigmatek.at;
Received: from VE1PR08MB4909.eurprd08.prod.outlook.com (2603:10a6:802:a8::22)
 by GV1PR08MB8033.eurprd08.prod.outlook.com (2603:10a6:150:9a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 08:56:04 +0000
Received: from VE1PR08MB4909.eurprd08.prod.outlook.com
 ([fe80::f60:da2a:818f:e6d3]) by VE1PR08MB4909.eurprd08.prod.outlook.com
 ([fe80::f60:da2a:818f:e6d3%3]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 08:56:04 +0000
From:   Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
To:     linux-rtc@vger.kernel.org
Cc:     johannes.kirchmair@sigmatek.at
Subject: [PATCH] rtc: rv3028: make rv3028 probeable from userspace
Date:   Mon, 27 Mar 2023 10:55:50 +0200
Message-Id: <20230327085550.1721861-1-johannes.kirchmair@sigmatek.at>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0142.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::26) To VE1PR08MB4909.eurprd08.prod.outlook.com
 (2603:10a6:802:a8::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4909:EE_|GV1PR08MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 175a957b-d3c6-4bca-710d-08db2ea11880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nnKVC4q6MlTk8WnQnX6o/W6V4MIVn9dwvxtvi/DFJsPK/Kqt7vm17Pr0SbWjOOVhHBQ1KAQB259FY4yTkHDpdZ6+7lqjfTNWpDoVNlwRVmuMIpQokLc6D0u1mIGZUnnKZoT93n5TE1g8Q+WFTMP9ckDqCjIEvJKH6CyslD0862O25tmv33pqs/BqwpTZ5pEJAuyRc7XF3PkpWkWmMWTfcwf+dWuydBLK0FqEg7BJVeyQntNe6Y0MsFFpi4TAbRE5nuzff3FEh+gYeEIDRy3gXStHKnEE+H8uNkSTzpTo5c6OTWB2HI5QpR7SpAtnvA7UEjv/m11Wtp7p5EW7gBscNDMlN9cbQjP5vNzXVvuFl7konqicmcdes5q2GXpEde2f5Oqz0ZrnXjyu4Kq7XdWjONJTacgj5Z6IyrAGP3masZqnEBIjyqcGpYIzhccrwqtG3+ZnX8A9dSMVGFsdCKwXdvGL5GSCJFtb6I+4iubTX2uEyF7ltjdfbjcYPpGRwuUsRosYrxQ4jl9xmoGKAL+V3Erw/Akl7Sqm2r7t/KlxxmAGXTPsb3zq/bDpdrKa4+YMB07zWg5DRTv5hpoLUiTKp/FbSlESBN7R5Vxn2GX4PygxJIjRym4rSlp52oA9BOSz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4909.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39840400004)(396003)(451199021)(66556008)(66946007)(41300700001)(6486002)(52116002)(5660300002)(44832011)(8936002)(478600001)(26005)(186003)(1076003)(316002)(4326008)(66476007)(6916009)(8676002)(6512007)(6666004)(6506007)(107886003)(2616005)(2906002)(38100700002)(38350700002)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zVEdn+vMaLM+erjhXVkWlT0ZcAD5D0njeYZGDoE28e8/TvwB9iSmCNEh9FxR?=
 =?us-ascii?Q?eWZ06REZS/kMsHTzKF2N6zV/p39eNUsBhgkY2lRZVKm6JLDrs225E2cXc6C6?=
 =?us-ascii?Q?RZhAmOOz++SzY8ptJ5Xauhlk0MFjgUVuANz7n2kks3B62q/IApDsZnxvEK1l?=
 =?us-ascii?Q?rsO61Fae9gCnPizcquiqenBR32af1wv5oYB6t/T5Ho600IO0oQtmswwRREzu?=
 =?us-ascii?Q?H/pqpkdG3YcSkoYwTXg5X4y7E2menEFjVK61oOkjFd81fRb8nKsP0ghQAWP5?=
 =?us-ascii?Q?vaBWbfvNE2ARt5+SrjCvruemlG/ncSRdRrgda4muhSSIGSelGQ+d678IWjVP?=
 =?us-ascii?Q?ApwufE5IubtJyPgH3T2iKx/w6G07A0OhP0s+x0u9xyiaxfGZCFrMisHwulCO?=
 =?us-ascii?Q?1ta9eiL1YY+jkk47XPVja4X4VxMwrlPJzhwhsdnh/pjAzMAW7cEOKI5v6Oas?=
 =?us-ascii?Q?9eLazbsz/bLb3VpperbzrPGRM40xHTmuq61kuKcJeYZcIeyUCAtMtKE9oLAV?=
 =?us-ascii?Q?YqsZdNkP0aUzBZWod6yq9D5ih1fAXXV6Hyq6+xabvw7C1HtymSLqQGO5+ojL?=
 =?us-ascii?Q?zeV0gynJyrqpQgNbvYejNtkJBvpRszCX8DCEbNCcMewjEuDskaB7LfhWyXzG?=
 =?us-ascii?Q?iLB3uVgG68JMHESDmHDvCPulmBLFFy8lM0IUe7XdcIV6sVDJTR1mq03NHxMx?=
 =?us-ascii?Q?gjyrNFAAxgJZwuwKI+MAEq+CAECLo3k6jzuo2EqvMm0gDYupc/hfow0ORmW4?=
 =?us-ascii?Q?YD4BmzWS8aDiM/aCZEOQngaiCawdiJ8J+Gvv8a2jNXW8MoHWdRigjlC010Qd?=
 =?us-ascii?Q?7oEFSDeiFy9mhSpygoRuIpyoLcYuUKdZ4noV9KXbrdVfjgm9D/kOqmbE953G?=
 =?us-ascii?Q?Uxz3KD97uYC+RbnVDuGxvsarXXIfxvEFLosCOT3cPCny3xWNdUE6fVHkkQi2?=
 =?us-ascii?Q?YVEkdwiQu1eaMKZC9D7QQQ2mRUgxSeTm48JsEomeqZPawBr/eC+RAiHoGoTg?=
 =?us-ascii?Q?VwbM6MQ2ojjvgnXdniTaq291TYGNeWJ/bOVKMDPS+PSrUIEybiHer7cHzyfo?=
 =?us-ascii?Q?vWAB82H1r/t3BFfBELl7gVViovFfqYXKKypNlTceqCkAlmqCqNFD1Ja+jYDM?=
 =?us-ascii?Q?DlrtpVq54Ur7tr5DwoySTHEIZfCiimNWSqrwdSVw+A9ljDSrtn90dEnIHLHB?=
 =?us-ascii?Q?CMhhfBou0mECG78mIJvqFf+v18Z7pzgFBUVA9AIoLN912rZgxscNg8E1xdaC?=
 =?us-ascii?Q?0w1g+eraLsNGeN66jAwwqq2QY/uLgBck5NC5y6TvLSoQUxtv4a0qAN5qB+fN?=
 =?us-ascii?Q?x4g5KQpM7YUiTqS0RJUsJJyCkKxgTqVVfMTcb+OkusdZG+pi5VvMGV2U23d+?=
 =?us-ascii?Q?woJ/4hVBUYGURMHh59JIlLGgCmAXGGOc0ImtKZsQFdEFe417bzPbz+zYh6Wg?=
 =?us-ascii?Q?pG3d1NgUq3r4glJMFSbtnduaLQN5R1razcVFaeYIgN5ilV2QZGJKxCTAdGx9?=
 =?us-ascii?Q?wuSZ5Q47V6skPjM/6JXXx6I8ZvfmEuRt/VN35MeYQTKN0dxZW3WuSFv3ErWm?=
 =?us-ascii?Q?yu5ZG4rUdKM2y61/VIJ3bTz6ANBFN6kkqCrsVZ3Dc4ag1Y6PFXHNjFUH5xYy?=
 =?us-ascii?Q?lusLwtFkA6+4rJWhtlSvNUo=3D?=
X-OriginatorOrg: sigmatek.at
X-MS-Exchange-CrossTenant-Network-Message-Id: 175a957b-d3c6-4bca-710d-08db2ea11880
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4909.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 08:56:04.1025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bcb1d87a-d2bc-486e-a62b-9ac9c746bc1b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMzid1PA1X7LM7DusV0yazdXQEcN+i5nHnHWeziromE1HEgcTi44rGVOjgBGIbbbBCKdKj6g9MrDhm+92sg+JuF99X9t9ZwKbQYM0FfV+2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8033
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

With this commit, it will be possible to bind a rv3028 device from
userspace

This is done by:
echo rtc-rv3028 0x52 > /sys/bus/i2c/devices/i2c-XX/new_device

Signed-off-by: Johannes Kirchmair <johannes.kirchmair@sigmatek.at>
---
 drivers/rtc/rtc-rv3028.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index ec5d7a614e2d..35fb27c11979 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -994,12 +994,19 @@ static const __maybe_unused struct of_device_id rv3028_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rv3028_of_match);
 
+static const struct i2c_device_id rv3028_id_table[] = {
+	{ .name = "rtc-rv3028", },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, rv3028_id_table);
+
 static struct i2c_driver rv3028_driver = {
 	.driver = {
 		.name = "rtc-rv3028",
 		.acpi_match_table = rv3028_i2c_acpi_match,
 		.of_match_table = of_match_ptr(rv3028_of_match),
 	},
+	.id_table	= rv3028_id_table,
 	.probe_new	= rv3028_probe,
 };
 module_i2c_driver(rv3028_driver);
-- 
2.25.1

