Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526C655DB15
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Jun 2022 15:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244621AbiF1G7X (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Jun 2022 02:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiF1G7W (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Jun 2022 02:59:22 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE175BF6;
        Mon, 27 Jun 2022 23:59:21 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25S2Hw8c031758;
        Tue, 28 Jun 2022 06:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=/DCUKu+9NOId9pgX8qQlKNv1KwvTjY4uNXnIMHzIlTo=;
 b=ZGZIXowMtjKpai5ubCAg6OXT8jc0T7knn17Sv87JvFAYVLT5qk5xzca6ZqJriZ08jMPi
 kdvvMnGj+bPqlLgEL7hzv5RXel2Vp5e1EJQ2NOMyVGDatfZWAo0y+NUcG6pILXYRGuUD
 CWS14yu5aMHH7+ojCS2v2b657dYkOClJRmHETOPXiK+gQ0azZwbm7SELhnQuLlwBC3FC
 sRNfv3uKjYWoDwc9CIrAYLIGBTZPVbzhC0A4qL9xvgI8Vgj66e+GXyTnV9mM3jWSN63L
 5/HLMDc049S4I8DPYu2T0pYSAswqRMTM4+lg50YMJtViLF2wFSqI6EveiAAUevuA6E/p Kw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwrscd5c6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Jun 2022 06:59:04 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25S6vD83036990;
        Tue, 28 Jun 2022 06:59:04 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gwrt1xrxy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Jun 2022 06:59:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N34p4Hd3cQFA0COl6jFFs5x1nztUd351BkmBA4/Cp0reb+9QJuEFAhbbUZXqHIhbxhK6w+CBlPKBlQpQwj3P6JID/xDnCU2bUFU0OgBD7tTb+Hs5Jp7h8dROfb5Cj+yDWzl6HWIoD0LG4VKmDpJF0Q/f71ruHfWxfcyMWn7nSNaHurqCvyo5dnuW1zzMWdjKFp9/UCzM13pCqUPoBsu/owrRXcDRnXUKah5Eccf72x6Ba1q2KdxFay/X4RBontxYqwiGziy2eaViBbUDZVEs3tP18uKLjoP3OK0td0+KDNZgsxN1ZcOtn0LKyZr2xqROanJtvdWviO27f2iOtEFsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DCUKu+9NOId9pgX8qQlKNv1KwvTjY4uNXnIMHzIlTo=;
 b=Ya1qFfUzG6lq5+c4rzb/HxOpE4oB5yRJgeGn9sc/qQDt0TT3pHgrvpA+OcKm9jm6wVvRWxju8vjBST+ZP+aYELxKns/P7thJI6+nOT6uOjYj7ckkbk+FzIGYNpoDyRQQnd7CYAPYcxm8/JUSzfj3j/SAc4FxawSVkjx5sH1WQxKKQOJkobj9JTFtR2zewMujKed9tTI6y2KpGSHCdt2zs8pockQu7jTv9zf4LRJ1uRntmW5zMojaU487052BgFHPZ55xCD9ThN5w5u1YhGBjOPQNP75OPUp8XTmWyIfWOOv99l2Q3M5YZ4Wgg3LxfvwFiQ2Oq8QK0xd/iip0vlXpgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DCUKu+9NOId9pgX8qQlKNv1KwvTjY4uNXnIMHzIlTo=;
 b=qMpdtUcktppIRQoldfSqMyhOxhubyIj64rpYN64eo+TZhkFo8uCe+ARCJjo1dNoKPHl1fWO8gqe/pH25RjENoUS3v2njw8wF9B7b9T7+DRCzfqYaCNLY9cYK4EIqnXRUkhC+9ev+MpVHGGDaTVI+Pj5/lEpdN9Mi65Q2rwKj5cw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB5643.namprd10.prod.outlook.com
 (2603:10b6:510:fa::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 06:59:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Tue, 28 Jun 2022
 06:59:02 +0000
Date:   Tue, 28 Jun 2022 09:58:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: rv8803: unlock on error path in rv8803_set_time()
Message-ID: <YrqmpT873Y99+a2d@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: AM0PR10CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1459586a-e167-412e-8f7d-08da58d3aec4
X-MS-TrafficTypeDiagnostic: PH0PR10MB5643:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eiiZaFPBE/Gou0SmNSpv5qrWaJedQT0pf9XZ/R4YG7YDXprqNWORceQyhYLMpEArBz4yHCUIzBXz8Ea9QJ1j7z5DCObP+JyoHh1ssCAaYLghZC2KfK6k+89q2BbFKums8475Rftywvmo5M72LUgA/tE1IrHby70K0S4kqlrSHWaTspx9zxhya4ziKisRE9p5yxVGivC+Gw7aPs32FwtBX0ytmWnS2PNlaA4wPwdM0odcGiLj/zmmkpXSWc1ajSHbFCCdAjU73cFNnvB/OIuibR8+TjIEPKlJjmQYmj95eKLUdWp1g15j7vYnlZMumiGR7tGGDY2Tr1xApP2p2npOY14FEf1Zs80OsrWebGahpdFQqfZFj1PSg+s9f0nxRJg5q+tkwyg1VnzC0DefaBVKphSox6nn2oQkjAjVWcOO0PqYxC+r+im41ozdBzdm3syV6KmvEsKGStDPUw7Ku6LSkn6HTm/k1aL6zgAJ5/qYKquMgzxvyW1/vIO8Tdx8Jb5xD779AcQWVZEZfTIqbmZdSS0w9EalrpqvenWFSqpHCfiogrAxXpf6sxIuvJNWZeUWTCUcN6oZ8rdCUzKITQsD/p/jq7oPBbek4qRXPE9KOqeu6CiU4LKP4ahh8NCQBFO57e8RdHLwYV6NzOqWMyUFJAzydhkqHflrdm8rOkayN2EfX5e7zCmp3u81CiHhh8xPx1xHJU8/025mADizDWrNqvyzK0/IM7sIr851HrAd6ii3W21dSncXhyf4VKi9dgM3WT0GXrDStgiGFf7YlQjDTDh5BXtOH/tzJ4EKMa5h6lY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(136003)(39860400002)(366004)(376002)(346002)(66476007)(2906002)(83380400001)(4326008)(54906003)(316002)(38100700002)(66556008)(66946007)(33716001)(8936002)(6486002)(5660300002)(110136005)(8676002)(4744005)(6506007)(52116002)(6666004)(44832011)(41300700001)(6512007)(186003)(478600001)(86362001)(9686003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bi6BrpAO3PdTo6kqjg2/tmRatN0DG9ahWJFb3uhiY0jSUClRQnl/K+Jg7XKy?=
 =?us-ascii?Q?lfDt/PDZJ44eFYhdNVwBhuKcgamxAUBhuD0LdqWMRGBUcqIT9EhuMw/3+Mn1?=
 =?us-ascii?Q?C6LZvPjZtWzLooOChnTNDfHpNaW/QkiWDivAfzxWuafhYP52eK8AUHGjTjam?=
 =?us-ascii?Q?WDMycHXX/Esr+802rCowB46aKUzKQQaq3uWIisqbzAsfexHc6neI0YZjEE9t?=
 =?us-ascii?Q?60eevM4qGSBAqb0ZOdVnpi7FLg52iZnziD2RAdi4NW6ojyqwx1ZsDN7PSGZy?=
 =?us-ascii?Q?E6t2P3PjqaqND95x95MbQV8XB9qfyy/ed/bN2l81qEGC0yPZ96gDvArSEaiq?=
 =?us-ascii?Q?B+tc9GAriiKm8DuYC4yykILmQ3rZsVLUdbxM/oFNvUAuYB/FZ44nezXUt6Gm?=
 =?us-ascii?Q?lEYoQNSvYIdXxGepLfiTFMaqHs9CazzNMnMFTl06cL25mSfMi+58g4fPJel6?=
 =?us-ascii?Q?7iQXgeMxCYwhFq/KLARknXyWYErTE3iYv1rnRE3XYoQ2x/GISgH+LFT68j8C?=
 =?us-ascii?Q?rf46ob9h7rzW3dtc0cEJk7BJ+Xoj5/f4OkyWbBXTd8TAGwPL1JWphukLwDr4?=
 =?us-ascii?Q?FEY2fivsH7Yy/42aEKlSdCt/YwmMK7H2x3YBeT7fPjtPBncZFYuG7a6QNI/X?=
 =?us-ascii?Q?TXBJVjNWm3mpdLg1T1cxHEN6lbDJDLcb6yoHY7ppRiBLdXzrrGtwZjomdLxH?=
 =?us-ascii?Q?yURLpPxUZvHO7sPyKpZScSe7aCkC038aQ0dOgZZo9TTXihPlOaRKiOB17bHa?=
 =?us-ascii?Q?DOdtcDoKBR/Sil6EncXUM2Qm1UrTeLr8Grl3d4/rC7p5UcvwMYQLcUsuGPXp?=
 =?us-ascii?Q?y3ZAnWy8rGd+i0le93C5nXWS51thcN84lyQrzBk8IJZFKVyQhoHv2bZ3PMam?=
 =?us-ascii?Q?CKEc7t70ZYb+BZHgrIuulwdq0W6anbiOupxZUaWj/cIAJetaN0Nok2S5OrRt?=
 =?us-ascii?Q?QjtqDGV3AQpVTpXnvWQfO9dj2bTrsh69LigdpDYG4iTGyjvQWU7iv51/xZnv?=
 =?us-ascii?Q?0sBwo01YiVUn4eNUVgmZcMRr5b33tswCmYinunCw6aMoQBvILYLi5qASBI5r?=
 =?us-ascii?Q?7j4HIgJezpy1TnO0c/50rLeyldL+E3IPX5CU2WbClDa/+qlN5MByVLCnkMDq?=
 =?us-ascii?Q?SZC/P38C4O/5+tH+qVdolscmfyBTa+eG5NnE04hcK6X2Uy2CynoglzfugkXC?=
 =?us-ascii?Q?EOxZGMU1naV4+pr4KpGuYjzT3Ah9iKXFpgLqCmEEjZWOTyF9ivNLMwRYXnFB?=
 =?us-ascii?Q?OPTxT+Lg4KFEhVxjIm4Wg4LgbGQi159kNHN5EEEzupZB+a7cS6Tvw9zrqVjp?=
 =?us-ascii?Q?J9e8OTD6rFECw0kT+pueQrFlqJh4zijeqfFYJO3lDT/W2xLz68XCWCXW6M5c?=
 =?us-ascii?Q?mN/FQJO+9nj/bZd7xmQC/hbINseHGB2GqHF43cZjJ9/7xCYJ6mUKmDMxAvi5?=
 =?us-ascii?Q?VQ1yvJIs4Er8nP2fW9IelSynUTiS+ysYKIJwNLL8nPwl62JZCdvuqpSjmxQl?=
 =?us-ascii?Q?h94e+ti44Qx74ary8itox94CFJ+Oag4IuCKvUJ2bhQhqugw6eMjpOxVBFwO6?=
 =?us-ascii?Q?VC3UMa0IkJGyYfaUL51weVaMN2rRBnLjnbcwRCk2ePFPH44g8WOxGXLO6ACP?=
 =?us-ascii?Q?+A4ne9PrQlD5FSH2+O2m8co=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1459586a-e167-412e-8f7d-08da58d3aec4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 06:59:02.3088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlDKc4VByI2yswQ9eduAI85P/63piuilJkzvAY4cL4nf97NONpUGoMLTydbYT7W7MNLst+4YuE5FGzNsciV7rE8bdnW1USYspM7rr49Tf2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5643
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-27_09:2022-06-24,2022-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206280028
X-Proofpoint-ORIG-GUID: Vj0ixqhXDuSIBdgamJxoIUZode2b2A8D
X-Proofpoint-GUID: Vj0ixqhXDuSIBdgamJxoIUZode2b2A8D
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call mutex_unlock(&rv8803->flags_lock) before returning if
rv8803_regs_reset() fails.

Fixes: f8176e0bb83f ("rtc: rv8803: initialize registers on post-probe voltage loss")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rtc/rtc-rv8803.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index fe1247e771b9..3527a0521e9b 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -315,8 +315,10 @@ static int rv8803_set_time(struct device *dev, struct rtc_time *tm)
 
 	if (flags & RV8803_FLAG_V2F) {
 		ret = rv8803_regs_reset(rv8803);
-		if (ret)
+		if (ret) {
+			mutex_unlock(&rv8803->flags_lock);
 			return ret;
+		}
 	}
 
 	ret = rv8803_write_reg(rv8803->client, RV8803_FLAG,
-- 
2.35.1

